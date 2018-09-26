<#
.Synopsis
    Generates ASCII strings for drawing boxes.

.Description
    Generates ASCII strings for drawing boxes.
    Also supports transforming an entire string.

.Parameter Count
    How many ASCII characters to emit.

.Parameter Style
    Which style to use, Single or Double.

.Parameter Name
    Which box art to emit.

.Parameter Text
    String that references box art aliases.
#>
function Get-BoxChar {
    param([ValidateRange(1,1000)][int]$Count = 1
        , [ValidateSet("Double","Single")][string]$Style = "Double"
        , [Parameter(Mandatory, ParameterSetName="byName")][ValidateSet("Cross", "DownLeft", "DownRight", "Horizontal", "HorizontalUpDownOther", "SplitDown", "SplitDownOther", "SplitLeft", "SplitLeftOther", "SplitRight", "SplitRightOther", "SplitUp", "SplitUpOther", "UpLeft", "UpRight", "Vertical", "VerticalRightLeftOther")]
            [string]$Name
        , [Parameter(Mandatory, ParameterSetName="byAlias")]
            [string]$Text
    )

    if($PSCmdlet.ParameterSetName -eq "byName") { [BoxClass]::$Style.$Name * $count }
    else { [BoxClass]::Transform($Text, $Style) }
}