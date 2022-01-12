using System;
using System.Linq;

class Program
{
    static void Main(string[] args)
    {
        string[] a = args[0].Split(' ');
        int i, p = 0, t = a.Count();

        for (int c = 0; c < t; c++)
        {
            i = int.Parse(a[c].Substring(2, a[c].Length - 3));

            if ( c == 0 ) { p = i; continue; };

            if (c == t - 1 && p < i) { Console.Write("><" + p + "> " + "><" + i + "> "); }
            else if (c == t - 1 && p > i) { p = i + p; Console.Write("><" + p + "> "); }
            else if (p < i) { Console.Write("><" + p + "> "); p = i; }
            else if (p > i) { p = i + p; }
            else  Console.Write("><" + p + "> ");
        }
    }
}