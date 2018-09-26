Class BoxClass {
    static [hashtable]$Double = @{
        Horizontal = [string][char]9552
        Vertical = [string][char]9553
        DownRight = [string][char]9556
        DownLeft = [string][char]9559
        UpRight = [string][char]9562
        UpLeft = [string][char]9565
        Cross = [string][char]9580
        SplitLeft = [string][char]9571
        SplitLeftOther = [string][char]9570
        SplitUp = [string][char]9577
        SplitUpOther = [string][char]9575
        SplitRight = [string][char]9568
        SplitRightOther = [string][char]9567
        SplitDown = [string][char]9574
        SplitDownOther = [string][char]9572
        HorizontalUpDownOther = [string][char]9578
        VerticalRightLeftOther = [string][char]9579
    }
    
    static [hashtable]$Single = @{
        Horizontal = [string][char]9472
        Vertical = [string][char]9474
        DownRight = [string][char]9484
        DownLeft = [string][char]9488
        UpRight = [string][char]9492
        UpLeft = [string][char]9496
        Cross = [string][char]9532
        SplitLeft = [string][char]9508
        SplitLeftOther = [string][char]9569
        SplitUp = [string][char]9524
        SplitUpOther = [string][char]9576
        SplitRight = [string][char]9500
        SplitRightOther = [string][char]9566
        SplitDown = [string][char]9516
        SplitDownOther = [string][char]9573
        HorizontalUpDownOther = [string][char]9579
        VerticalRightLeftOther = [string][char]9578
    }
    
    static [hashtable]$Corner = @{
        DoubleRightSingleUp = [string][char]9560
        DoubleRightSingleDown = [string][char]9554
        DoubleLeftSingleUp = [string][char]9563
        DoubleLeftSingleDown = [string][char]9557

        DoubleUpSingleRight = [string][char]9561
        DoubleUpSingleLeft = [string][char]9564
        DoubleDownSingleRight = [string][char]9555
        DoubleDownSingleLeft = [string][char]9558
    }

    static $Alias = [ordered]@{
        "/_" = "DownRight"
        "\_" = "UpRight"
        "_\" = "DownLeft"
        "_/" = "UpLeft"
        "|" = "Vertical"
        "-" = "Horizontal"
        "+" = "Cross"
        "^" = "SplitUp"
        "v" = "SplitDown"
        "<" = "SplitLeft"
        ">" = "SplitRight"
    }

    static [string]Transform([string]$AliasString, [string]$Style) {
        if($style -notin @("Double","Single")) {
            Write-Warning "Invalid Style - no transformation; use either Double or Single."
        }
        else {
            foreach($nv in [BoxClass]::Alias.GetEnumerator()) {
                $AliasString = $AliasString -replace [regex]::Escape($nv.name), ([BoxClass]::$style.$($nv.value))
            }
        }
        return $AliasString
    }
}