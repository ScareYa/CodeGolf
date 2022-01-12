param ($s)
$a = $s -split '' -ne ''
$a += $a[0]
$a | % {if($r -eq $_) {$o += +$_} $r = $_ } 
$o