<#
## code by naramy
##
## Windows Defender Script
##
## version 0.0.1, 2019.10.08 (last modified)
#>

$ver = "0.0.1"

Write-Output "* * * * * * * * * * * * * * * * * * * * * * * * * *"
Write-Output "* * *      Windows Defender Script $ver      * * *"
Write-Output "* * * * * * * * * * * * * * * * * * * * * * * * * *"

# Main

$pref = Get-MpPreference
Write-Host

# Email Scanning Enable
# Default : True
Write-Host 'DisableEmailScanning :' $pref.DisableEmailScanning '-> False'
Write-Host
Set-MpPreference -DisableEmailScanning 0

## Network protection
## Against exploitation of known vulnerabilities
## Default : None (equals False)

if([string]::IsNullOrEmpty($pref.DisableIntrusionPreventionSystem)) {
    Write-Output "DisableIntrusionPreventionSystem : None -> None"
    Write-Host
} else {
    Write-Host 'DisableIntrusionPreventionSystem :' $pref.DisableIntrusionPreventionSystem '-> False'
    Write-Host
}

Set-MpPreference -DisableIntrusionPreventionSystem 0

# Scanning removable drives Enable
# Default : True (Disabled)
Write-Host 'DisableRemovableDriveScanning :' $pref.DisableRemovableDriveScanning '-> False'
Write-Host
Set-MpPreference -DisableRemovableDriveScanning 0

# Scanning of restore points Enable
# Default : True (Disabled)
Write-Host 'DisableRestorePoint :' $pref.DisableRestorePoint '-> False'
Write-Host
Set-MpPreference -DisableRestorePoint 0

# Scanning for network files Disable
# Default : False (Enabled)
# Microsoft Recommend : True (Disabled)
Write-Host 'DisableScanningNetworkFiles :' $pref.DisableScanningNetworkFiles '-> True'
Write-Host
Set-MpPreference -DisableScanningNetworkFiles 1

# Scanning of scripts Enable
# Default : False (Disabled)
Write-Host 'DisableScriptScanning :' $pref.DisableScriptScanning '-> True'
Write-Host
Set-MpPreference -DisableScriptScanning 1

# Network Protection Enable
# Default : 0 (Disabled)
Write-Host 'EnableNetworkProtection :' $pref.EnableNetworkProtection '-> 1'
Write-Host
Set-MpPreference -EnableNetworkProtection 1

# Membership in Microsoft Active Protection Service Enable
# Default : 0 (Disabled)
# 1 -> Basic Membership, 2-> Advanced Membership
Write-Host 'MAPSReporting :' $pref.MAPSReporting '-> 2'
Write-Host
Set-MpPreference -MAPSReporting 2

# PUAProtection Enable
Write-Host 'PUAProtection :' $pref.PUAProtection '-> 1'
Write-Host
Set-MpPreference -PUAProtection 1

# Checking for Definition Update
# Default : 0 (Default Interval)
# Setting : 2 (every 2 hours)
Write-Host 'SignatureUpdateInterval :' $pref.SignatureUpdateInterval '-> 2'
Write-Host
Set-MpPreference -SignatureUpdateInterval 2

# Checking for Submitting Sample
# Default : 1 (Safe Sample sends automatically)
# Setting : 0 (Always Prompt)
# Write-Host 'SubmitSamplesConsent :' $pref.SubmitSamplesConsent '-> 0'
# Write-Host
# Set-MpPreference -SubmitSamplesConsent 0

CMD /c PAUSE