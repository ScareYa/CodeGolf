param ($s)

$x = $s.IndexOf("x")
$w = $s.substring(0,$x)
$h = $s.substring($x+1,$s.length-$x-1)

$x = ' '*(($w-1)/2)+'#'
$t = '#'*(($w-3)/2)

' '+'#'*($w-2)+'  '+$x

for($c=1; $c -lt $h; $c++) {
    $p = if ($c -eq ($h-1)/2) {$t + 'RIP' + $t + ' '} else {'#'*$w+' '}
    if ($c -eq 1) {$p += '#'*$w} else {$p += $x}
    $p
}