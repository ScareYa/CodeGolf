param ($s)
$s
$s | % {if($_ -eq 'r') {$t = '/'} }
$t

#param ($s)
#$a = $s -split '' -ne ''
#$a += $a[0]
#$a | % {if($r -eq $_) {$o += +$_} $r = $_ } 
#$o