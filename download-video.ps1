$Source = "http://youcantstopthememes.github.io/ImportantVideo.mp4"
$Dest = "C:\ITS\ImportantVideo.mp4"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $Source -OutFile $Dest

$Action = New-ScheduledTaskAction -Execute "C:\Program Files\VideoLAN\VLC\vlc.exe" -Argument "--play-and-exit C:\ITS\ImportantVideo.mp4"

$Trigger = New-ScheduledTaskTrigger -Daily -At 4:20pm

$User = $env:UserName

Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName "Important Task" -User $User