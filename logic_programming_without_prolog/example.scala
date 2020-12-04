// Iterator[A]
//   - Have next() and hasNext() methods
//   - A computation that nondeterministically produces A's
//
// -Monad
//   -Additive monad

def toIterator[A](a: A): Iterator[A] = Iterator(a)
def failure[A](): Iterator[A] = Iterator()
def or[A](it1: Iterator[A], it2: Iterator[A]): Iterator[A] = it1 ++ it2
def and[A, B](it: Iterator[A],
              f: A => Iterator[B]): Iterator[B] = it.flatMap(f)

// i <- 1..10
// j <- 1..10
// (i, j)

def oneThroughThree(): Iterator[Int] = //Iterator(1, 2, 3)
  or(toIterator(1), or(toIterator(2), toIterator(3)))

def genPair(): Iterator[(Int, Int)] =
  and(oneThroughThree,
    (x: Int) => and(oneThroughThree,
      (y: Int) => toIterator((x, y))))
  // oneThroughThree.flatMap(x =>
  //   oneThroughThree.flatMap(y =>
  //     Iterator((x, y))))


// MONADS:
// For any type M[A], you define these two operations
// def unit[A](a: A): M[A] = ???
// def bind[A, B](it: M[A],
//                f: A => M[B]): M[B] = ???

// ADDITIVE MONADS:
// Monads with two additional operations:
// def mzero[A](): M[A] = ???
// def mplus[A](it1: M[A], it2: M[A]): M[A] = ???

def genPairCleaner(): Iterator[(Int, Int)] =
  // oneThroughThree().flatMap(
  //   x => oneThroughThree().flatMap(
  //     y => Iterator((x, y))))
  for {
    x <- oneThroughThree()
    y <- oneThroughThree()
  } yield (x, y)
