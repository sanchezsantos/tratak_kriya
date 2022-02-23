$basic=30 #30,1min,2min = 7mins
$intermediate=60 #1min, 2min, 4min = 14 mins
$advanced=120 #2min, 4min, 8min = 28 mins


$mode=$basic
Write-Host($mode.ToString() + " seconds is the time constant.")
$OpenWav=New-Object System.Media.SoundPlayer
$OpenWav.SoundLocation='C:\Windows\Media\Ring06.wav'

$CloseWav=New-Object System.Media.SoundPlayer
$CloseWav.SoundLocation='C:\Windows\Media\Alarm04.wav'

for (($i = 0); $i -lt 3; $i++)
{
    Start-Sleep -Seconds (([Math]::Pow(2,$i)*$mode))
    Write-Host((([Math]::Pow(2,$i))*$mode).ToString() + " seconds complete. Close your eyes.")
    $CloseWav.playsync()

    Start-Sleep -Seconds (([Math]::Pow(2,$i))*$mode)
    Write-Host((([Math]::Pow(2,$i))*$mode).ToString() + " seconds complete. Open your eyes.")
    $OpenWav.playsync()
}



