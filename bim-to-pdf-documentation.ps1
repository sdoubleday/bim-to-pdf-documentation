
#Cmdlet Binding Attributes
[CmdletBinding()]
PARAM(

[Parameter(Mandatory= $true,ValueFromPipelineByPropertyName= $true)][Alias("FullName")]
[ValidateNotNullorEmpty()][ValidateScript({
            IF (Test-Path -PathType leaf -Path $_ ) 
                {$True}
            ELSE {
                Throw "$_ is not a file."
            } 
        })][String]$InputBimFile

)

BEGIN   {}<# END BEGIN    #>
PROCESS {
[System.IO.FileInfo]$file = Get-ChildItem $InputBimFile;

$Path = Split-Path $InputBimFile;
$CoreName = Split-Path $InputBimFile -Leaf;
$JsonName = $CoreName.Replace($file.Extension,'.json');
$MdName = $CoreName.Replace($file.Extension,'_Documentation.md');
$PdfName = $CoreName.Replace($file.Extension,'_Documentation.pdf');

Copy-Item $file -Destination "$PSScriptRoot\$JsonName";
textrude render --models "$PSScriptRoot\$JsonName" --template $PSScriptRoot\template.txt --output "$Path\$MdName" ;
Remove-Item "$PSScriptRoot\$JsonName";
pandoc "$Path\$MdName" -o "$Path\$PdfName" ;

}<# END PROCESS  #>
END     {}<# END END      #>


