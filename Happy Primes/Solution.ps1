param ($p)
@(2..($p-1)) | % {if ($p % $_ -eq 0) {break}}
while ($p -notin 1,4 ) {
    $s = 0
    $p -split '' | % { $s += $_/1 * $_ }
    $p = $s
}
if ($p -eq 1) {1}