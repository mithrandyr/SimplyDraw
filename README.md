# SimplyDraw
ASCII Graphic tools for PowerShell

Get-BoxClass will return a type for the class created in the module

``` powershell
$draw = Get-BoxClass
$draw::Double.Cross
```

Get-BoxChar will either return a specific box art character or transform a string with aliases.

``` powershell
Get-BoxChar -Style Double -Name Cross -Count 10
Get-BoxChar -Style Single -Text "/_---v---v---_\"
```