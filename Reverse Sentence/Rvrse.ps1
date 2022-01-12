param ($s)
$s = $s.Replace(".","") -split " "
[array]::Reverse($s)
foreach ($a in $s) {$o = $o + $a + " "}
$o.Substring(0,1).ToUpper() + $o.ToLower().TrimEnd().Substring(1) + "."