$prepare = 2
$measure = 12

Echo "Test copying file script"
Echo "Each command will be run $prepare times to mitigate OS fluctuations"
Echo "It will then be run $measure more times, timed and averaged"


$fromDrive = "K"
$toDrive = "C"

&".\copyscript.ps1"


$fromDrive = "J"
$toDrive = "C"

&".\copyscript.ps1"


$fromDrive = "C"
$toDrive = "K"

&".\copyscript.ps1"


$fromDrive = "C"
$toDrive = "J"

&".\copyscript.ps1"


pause