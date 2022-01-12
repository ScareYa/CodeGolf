cls
#write-host 'wtf'

#get-alias ?

#get-alias | ForEach {
#$cmd=get-command $_.definition
#$alias=$cmd.parameters | select -expand values | select -expand Aliases
#new-object PSObject -prop @{
#Name = $_.definition
#Alias = $_.Name
#AliasProperty = $alias
#}
#}

function y ($i) {
    $a = $i -split '\n' | % {iex $_}
    $d = @()
    while ($a.Count -gt 0) {
        $m = $a[0]
        $a | % { if($_ -lt $m ) {$m = $_ }}
        $d += $m
        $b = $a
        $a = @()
        $b | % { if($_ -ne $m) {$a += $_}}
    }
    $d
}

write-host ''

y(@"
456
1
-99
12345
"@
)
