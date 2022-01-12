class p
{
    static void Main(string[] a)
    {
        var f = new int[30];
        int i = f[0] = f[1] = 1;
        for (; ++i < 30;)
            f[i] = f[i - 1] + f[i - 2];
        System.Console.Write(f[int.Parse(a[0]) - 1]);
    }
}