<#
.SYNOPSIS
    Imports the local module runs the tests and then removes the local module.
#>
[CmdletBinding()]

$ModulePath = Get-ChildItem -Path $PSScriptRoot -Filter "*.psd1"

Import-Module ($ModulePath).FullName

# Test Save a CSV
Write-Output "==========================="
Select-FileSystemForm -Start ([Environment]::GetFolderPath('MyDocuments')) -Description "This is a test so files will not be written" -Ext "csv" -File -Save

# Test Read a Markdown file
Write-Output "==========================="
Select-FileSystemForm -File -Ext md -Start $PSScriptRoot -Description "Select a file to read to the operator window" | ForEach-Object { Get-Content $_}

# Test Select a file with no extension
Write-Output "==========================="
Select-FileSystemForm -File -Start $PSScriptRoot

# Test Select a Folder from MyDocuments
Write-Output "==========================="
Select-FileSystemForm -Start ([Environment]::GetFolderPath('MyDocuments'))

# Test Select a Folder with no start
Write-Output "==========================="
Select-FileSystemForm

Remove-Module -Name ([io.path]::GetFileNameWithoutExtension($ModulePath))