# Docs From Folder (DFF)
# Copyright (C) 2016 by Den Delimarsky. All rights reserved.

param (
    [Parameter(Mandatory=$true)][string]$location,
    [Parameter(Mandatory=$true)][string]$output,
    [Parameter(Mandatory=$true)][switch]$scanSubFolders = $false
 )

# Check to make sure there was a location specified
if ($location -and $output){
    Write-Host "Checking for DLLs in "$location"...";
    $files = 0;
    $stringPath = "";

    if ($scanSubFolders)
    {
        Write-Host "Will scan subfolders...";
        $files = Get-ChildItem -Force -Path "$location\*" -Include *.dll -Recurse;
    } else {
        Write-Host "Will NOT scan subfolders."
        $files = Get-ChildItem -Force -Path "$location\*" -Include *.dll;
    }

    $files | foreach-object {
      Write-Host "Generating doc for $_";
      mdoc update "$_" -o "$output";
    }
}
else
{
    Write-Error "You need to specify both a source location and target output location."
}
