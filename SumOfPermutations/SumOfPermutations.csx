int M(string a)
 {
 int c = a.Length, t = 0, s = 1;
 for (int i = 1; i < c; i++) s *= i;
 foreach (var n in a) t += (n - 48) * int.Parse(new String('1', c)) * s;
 return t;
 }