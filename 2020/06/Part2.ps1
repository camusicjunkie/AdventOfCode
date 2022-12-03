$yes = $null

(Get-Content $PSScriptRoot\input.txt -Raw) -split '(\r?\n){2}' | Where-Object { $_.Trim() } | Foreach-Object {
    $diff = $equal = $null
    $strings = (-split $_)
    for ($i = 0; $i -lt $strings.Count; $i++) {
        if ($i + 2 -gt $strings.Count) { break }
        $diff = if ($null -eq $equal.InputObject) { $strings[$i + 1].ToCharArray() } else { $equal.InputObject }
        $equal = (Compare-Object $strings[$i].ToCharArray() $diff -ExcludeDifferent -IncludeEqual)
    }

    $yes += $equal.Count
}

$yes
