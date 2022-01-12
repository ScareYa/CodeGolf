function C ($l) {

$b = $null
$b += @('',' ')
$b += @(0..9)
$b += 65..90 | % {[char]$_ }
$b += 97..122 | % {[char]$_ }

$l -split '' | % { if($_) {
    for($c=0; $c -lt 64; $c++) { if( $b[$c] -ceq $_ ) { $e += $c } }
    if ( $e -gt 63 ) { $e = $e - 63 }
    $s += $b[$e]
}
}
$s
}
cls

C "zzzzzzzzzzzzzzzz"