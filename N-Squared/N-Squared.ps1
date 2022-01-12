param ($i)
$s = '+'*$i
for ($c=2; $c -lt $i; $c++) {"+"+"o"*$i-2+"+"}
$s
if ($i -gt 1) {$s}

#param ($s)
#$a = $s -split '' -ne ''
#$a += $a[0]
#$a | % {if($r -eq $_) {$o += +$_} $r = $_ } 
#$o

#Param($n) '+'*$n+"`n" + ("+"+'o'*($n-2)+"+`n")*($n-2) + '+'*$n