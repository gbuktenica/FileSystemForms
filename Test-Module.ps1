<#
.SYNOPSIS
    Imports the local module runs the tests and then removes the local module.
#>
[CmdletBinding()]

$ModulePath = Get-ChildItem -Path $PSScriptRoot -Filter "*.psd1"

Import-Module ($ModulePath).FullName

# Test Save a CSV
Select-FileSystemForm -Start ([Environment]::GetFolderPath('MyDocuments')) -Description "Save File" -Ext "csv" -File -Save

# Test Read a Markdown file
Select-FileSystemForm -File -Ext md -Start $PSScriptRoot | ForEach-Object {Get-Content $_}

# Test Select a Folder
Select-FileSystemForm -Start ([Environment]::GetFolderPath('MyDocuments'))

Remove-Module -Name ([io.path]::GetFileNameWithoutExtension($ModulePath))