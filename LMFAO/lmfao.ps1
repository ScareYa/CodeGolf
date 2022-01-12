param ($s)
$s -split ' ' | % { $o += $_[0] }
$o.ToUpper()