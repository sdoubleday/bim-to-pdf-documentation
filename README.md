# bim-to-pdf-documentation
SQL Server Analysis Services (SSAS) and Power BI .bim file converted to documentation .pdf

## Example
```powershell
.\bim-to-pdf-documentation.ps1 -InputBimFile ..\somewhere\else\MyModelName.bim
```
Outputs MyModelName_Documentation.pdf and MyModelName_Documentation.md in ..\somewhere\else\ .

## Usage
Converts your bim file to pdf, with markdown along the way.

Enumerates:
- Tables
  - Columns,
  - Hierarchies, and
  - Measures.

Listing, when not blank:
1. Name
1. Description
1. DisplayFolder
1. Table
1. Expression
1. IsHidden
1. DataType
1. FormatString
1. Annotations

## Requirements
- PowerShell
- PanDoc, with pdflatex
- Textrude CLI

## Setup script
Here is a script using the chocolatey package manager to get the requirements installed. Note that pandoc and miktex will complain about miktex not being updated recently, but the bim-to-pdf-documentation.ps1 script still works in spite of that:

```powershell
Write-Verbose -Verbose "Download Dotnet 5 for textrude...";
choco install dotnet-5.0-runtime -y;

Write-Verbose -Verbose "Download textrude cli...";
choco install textrude -y;

Write-Verbose -Verbose "Download miktex for pandoc, specifically for pdflatex...";
choco install miktex -y;

Write-Verbose -Verbose "Download pandoc...";
choco install pandoc -y;
```
