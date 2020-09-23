// example showing why tail recursion optimizations need to be a thing
public class Example {
    // Not tail recursive
    public static int sum(int[] array, int position) {
        if (position < 0 || position >= array.length) {
            return 0;
        } else {
            return array[position] + sum(array, position + 1);
        }
    }

    // is tail recursive - can do a tail recursion optimization
    // ...but Java doesn't do those
    public static int sum(int[] array, int accum, int position) {
        if (position < 0 || position >= array.length) {
            return accum;
        } else {
            return sum(array, accum + array[position], position + 1);
        }
    }
    
    public static void main(String[] args) {
        final int[] array = new int[50000];
        //System.out.println(sum(array, 0));
        System.out.println(sum(array, 0, 0));
    }
}
