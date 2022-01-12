param ($l)

$a = $l -split '\r\n'
$a | % {
    $s = $_
    $c += 1
    :i foreach ($x in $a)
    {
        $d += 1
        if ($s -ceq $x -and $c -ne $d) { break i }
        if ($s -ceq $x -and $c -eq $d) { $s }
    }
    $d = 0
}