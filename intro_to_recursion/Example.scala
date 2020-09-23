// Scala has tail recursion optimization, unlike java
object Example {
  // blows the stack
  // Not tail recursive
  def sum(array: Array[Int], position: Int): Int = {
    if (position < 0 || position >= array.length) {
      0
    } else {
      array(position) + sum(array, position + 1)
    }
  }

  // is tail recursive - can do a tail recursion optimization
  // ...and Scala does those!
  def sum(array: Array[Int], accum: Int, position: Int): Int = {
    if (position < 0 || position >= array.length) {
      accum
    } else {
      sum(array, accum + array(position), position + 1)
    }
  }

  def main(args: Array[String]) {
    val array = 0.to(50000).toArray
    println(sum(array, 0, 0))
  }
}
