class Program
{
    static void Main()
    {
        string s = "00000000", t;
        int c = 0, i = 0, n = 0;
        while (n < 100)
        {
            t = "";
            foreach (char r in s) t = r + t;
            
            foreach (char r in s) if (r == '1') c++;
            if (c == 0 || c == 2 || c == 4 || c == 6) { n++; System.Console.WriteLine(i); };
            System.Console.WriteLine(System.Convert.ToString(i,2));
            s = ""; c = 1;
            foreach (char r in t) {
                if (r == '1' & c == 1) { s = "0" + s; c = 1; }
                else if (r == '0' & c == 1) { s = "1" + s; c = 0; }
                else s = r + s;
            }
            i++;
        }
        System.Console.Read();
    }
}
