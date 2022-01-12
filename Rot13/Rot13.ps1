param($s)

foreach ($c in [int[]][char[]]$s) {

    if     ($c -in  97..109) { $c = ($c+13) }
    elseif ($c -in 110..122) { $c = ($c-13) }
    $b += [char]$c

}

$b