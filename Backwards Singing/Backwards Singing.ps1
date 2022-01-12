param ($s)
$w = $s -split ' '
$w | %{ $o += -join $_[$_.Length..0] + ' ' }
$o