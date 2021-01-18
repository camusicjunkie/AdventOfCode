#requires -version 7.0

$file = Get-Content $PSScriptRoot\input.txt -Raw
$nl = [System.Environment]::NewLine
$passports = $file -split "$nl$nl"

$i = 0

foreach ($passport in $passports) {
    $hash = @{}
    foreach ($item in (-split $passport)) {
        $hash += ($item | ConvertFrom-StringData -Delimiter ':')
    }

    switch ($hash) {
        { -not ($_.byr -ge 1920 -and $_.byr -le 2002) } { break }
        { -not ($_.iyr -ge 2010 -and $_.iyr -le 2020) } { break }
        { -not ($_.eyr -ge 2020 -and $_.eyr -le 2030) } { break }
        { -not ($_.hcl -match '^#[0-9a-f]{6}$') } { break }
        { -not ($_.ecl -match 'amb|blu|brn|gry|grn|hzl|oth') } { break }
        { -not ($_.pid -match '^\d{9}$') } { break }
        { if (-not $_.ContainsKey('hgt')) { break } else { ($_.hgt -match '(\d+)(cm$|in$)') } } {
            switch ($_.hgt -match '(\d+)(cm$|in$)') {
                { $matches[2] -eq 'cm' -and $matches[1] -ge 150 -and $matches[1] -le 193 } { $i++; break }
                { $matches[2] -eq 'in' -and $matches[1] -ge 59 -and $matches[1] -le 76 } { $i++; break }
                default { break }
            }
        }
    }
}

$i
