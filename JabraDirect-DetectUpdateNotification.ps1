# ---------------------------------------------------------------------------------
# NAME: JabraDirect-DetectUpdateNotification
# AUTHOR: Ellis Barrett - A365
# CREATION DATE: 18/07/2023
# ---------------------------------------------------------------------------------

# Get Config.json
Write-Host "Check for Jabra Direct Config.json"
$json = "$([Environment]::GetFolderPath("ApplicationData"))\Jabra Direct\config.json"

#Check if Config.json is present
if (Test-path("$json")) 
{
        Write-Output "Found the Config File"
        #Get Json file
        $a = Get-Content "$json" -Raw | ConvertFrom-Json
        If (($a.DirectShowNotification.value -eq $false) -and ($a.DirectShowNotification.locked -eq $true) -and ($a.EnableFeedback.value -eq $false) -and ($a.EnableFeedback.locked -eq $true))
        {
            Write-Output "Compliant"
            Exit 0
        } else {
            Write-Warning "Not Compliant"
            Exit 1
        }
} else {
        Write-Output "Didn't find the Config File"
        Exit 0
    }

