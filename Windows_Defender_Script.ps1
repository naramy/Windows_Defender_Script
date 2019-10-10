<#
## code by naramy
##
## Windows Defender Script
##
## version 0.0.2, 2019.10.10 (last modified)
#>

$pref = Get-MpPreference
$is_already_done = $True

try {
    Set-MpPreference -DisableScriptScanning $pref.DisableScriptScanning -ErrorAction Stop
} catch {
    Write-Host "Do run PowerShell as admin using ExecuteMe.bat"
    CMD /c PAUSE
    exit
}

$ver = "0.0.2"

Write-Output "* * * * * * * * * * * * * * * * * * * * * * * * * *"
Write-Output "* * *      Windows Defender Script $ver      * * *"
Write-Output "* * * * * * * * * * * * * * * * * * * * * * * * * *"
Write-Host

# Main

# Archive Scanning Enable
if($pref.DisableArchiveScanning -ne 1) {
    Write-Host 'DisableArchiveScanning :' $pref.DisableArchiveScanning '-> True'
    Write-Host
    Set-MpPreference -DisableArchiveScanning 1
    $is_already_done = $False
}

# Email Scanning Enable
# Default : True
if($pref.DisableEmailScanning -ne 0) {
    Write-Host 'DisableEmailScanning :' $pref.DisableEmailScanning '-> False'
    Write-Host
    Set-MpPreference -DisableEmailScanning 0
    $is_already_done = $False
}

## Network protection
## Against exploitation of known vulnerabilities
## Default : None (equals False)
if(![string]::IsNullOrEmpty($pref.DisableIntrusionPreventionSystem) -and !($pref.DisableIntrusionPreventionSystem -ne 0)) {
    Write-Host 'DisableIntrusionPreventionSystem :' $pref.DisableIntrusionPreventionSystem '-> False'
    Write-Host
    Set-MpPreference -DisableIntrusionPreventionSystem 0
    $is_already_done = $False
}

# Scanning removable drives Enable
# Default : True (Disabled)
if($pref.DisableRemovableDriveScanning -ne 0) {
    Write-Host 'DisableRemovableDriveScanning :' $pref.DisableRemovableDriveScanning '-> False'
    Write-Host
    Set-MpPreference -DisableRemovableDriveScanning 0
    $is_already_done = $False
}

# Scanning of restore points Enable
# Default : True (Disabled)
if($pref.DisableRestorePoint -ne 0) {
    Write-Host 'DisableRestorePoint :' $pref.DisableRestorePoint '-> False'
    Write-Host
    Set-MpPreference -DisableRestorePoint 0
    $is_already_done = $False
}

# Scanning for network files Disable
# Default : False (Enabled)
# Microsoft Recommend : True (Disabled)
if($pref.DisableScanningNetworkFiles -ne 1) {
    Write-Host 'DisableScanningNetworkFiles :' $pref.DisableScanningNetworkFiles '-> True'
    Write-Host
    Set-MpPreference -DisableScanningNetworkFiles 1
    $is_already_done = $False
}

# Scanning of scripts Enable
# Default : False (Enabled)
if($pref.DisableScriptScanning -ne 0) {
    Write-Host 'DisableScriptScanning :' $pref.DisableScriptScanning '-> False'
    Write-Host
    Set-MpPreference -DisableScriptScanning 0
    $is_already_done = $False
}

# Network Protection Enable
# Default : 0 (Disabled)
if($pref.EnableNetworkProtection -ne 1) {
    Write-Host 'EnableNetworkProtection :' $pref.EnableNetworkProtection '-> 1'
    Write-Host
    Set-MpPreference -EnableNetworkProtection 1
    $is_already_done = $False
}

# Membership in Microsoft Active Protection Service Enable
# Default : 0 (Disabled)
# 1 -> Basic Membership, 2-> Advanced Membership
if($pref.MAPSReporting -ne 2) {
    Write-Host 'MAPSReporting :' $pref.MAPSReporting '-> 2'
    Write-Host
    Set-MpPreference -MAPSReporting 2
    $is_already_done = $False
}

# PUAProtection Enable
if($pref.PUAProtection -ne 1) {
    Write-Host 'PUAProtection :' $pref.PUAProtection '-> 1'
    Write-Host
    Set-MpPreference -PUAProtection 1
    $is_already_done = $False
}

# Checking for Definition Update
# Default : 0 (Default Interval)
# Setting : 2 (every 2 hours)
if($pref.SignatureUpdateInterval -ne 2) {
    Write-Host 'SignatureUpdateInterval :' $pref.SignatureUpdateInterval '-> 2'
    Write-Host
    Set-MpPreference -SignatureUpdateInterval 2
    $is_already_done = $False
}

# Checking for Submitting Sample
# Default : 1 (Safe Sample sends automatically)
# Setting : 0 (Always Prompt)
# if($pref.SubmitSamplesConsent -ne 0) {
#     Write-Host 'SubmitSamplesConsent :' $pref.SubmitSamplesConsent '-> 0'
#     Write-Host
#     Set-MpPreference -SubmitSamplesConsent 0
#     $is_already_done = $False
# }

if($is_already_done) {
    Write-Output "You don't have to execute this script"
    Write-Output "Already Done"
    Write-Host
}

CMD /c PAUSE