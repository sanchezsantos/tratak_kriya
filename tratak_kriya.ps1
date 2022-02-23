$basic=30 #30,1min,2min = 7mins
$intermediate=60 #1min, 2min, 4min = 14 mins
$advanced=120 #2min, 4min, 8min = 28 mins


$mode=$basic
Write-Host("`r`nThis is the buffer time of 20 seconds, your practice will start at the next chime." + "`r`n`r`nTime will increment by " + $mode.ToString() + " seconds each cycle.")

Start-Sleep -Seconds 20 #buffer, to settle down

$OpenWav=New-Object System.Media.SoundPlayer
$OpenWav.SoundLocation='C:\Windows\Media\Ring06.wav'

$CloseWav=New-Object System.Media.SoundPlayer
$CloseWav.SoundLocation='C:\Windows\Media\Alarm04.wav'

$OpenWav.playsync() # start the practice

for (($i = 0); $i -lt 3; $i++)
{
    Start-Sleep -Seconds (([Math]::Pow(2,$i)*$mode))
    Write-Host((([Math]::Pow(2,$i))*$mode).ToString() + " seconds complete. Close your eyes.")
    $CloseWav.playsync()

    Start-Sleep -Seconds (([Math]::Pow(2,$i))*$mode)
    Write-Host((([Math]::Pow(2,$i))*$mode).ToString() + " seconds complete. Open your eyes.")
    $OpenWav.playsync()
}



