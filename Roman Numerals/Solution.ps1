param ($i)
$s=''
[ordered]@{'M'=1000
'D'=500
'C'=100
'L'=50
'X'=10
'V'=5
'I'=1}| % getenumerator | % {
if($_.value.ToString() -match "1") {
    $q = [Math]::floor($i / $_.value)
    if( $q -lt 4 ) { $s += $_.key * $q }
    elseif ( $q -eq 9 ) { $s += $_.key + $r }
    elseif ( $q -eq 4 ) { $s += $_.key + $p }
    else { $s += $p + $_.key * ( $q - 5 ) }
    $i %= $_.value
    $r = $_.key
}
else { $p = $_.key }
}
$s