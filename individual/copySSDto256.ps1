$prepare = 5
$measure = 15
$fromDrive = "C"
$toDrive = "J"

Echo "Test copying file script"
Echo "Each command will be run $prepare times to mitigate OS fluctuations"
Echo "It will then be run $measure more times, timed and averaged"

$smallPath = $fromDrive + ":\_testing\small-files"
$mediumPath = $fromDrive + ":\_testing\medium-files"
$largePath = $fromDrive + ":\_testing\large-files"
$xlargePath = $fromDrive + ":\_testing\xlarge-files"
$smallPathDest = $toDrive + ":\_testing\small-files"
$mediumPathDest = $toDrive + ":\_testing\medium-files"
$largePathDest = $toDrive + ":\_testing\large-files"
$xlargePathDest = $toDrive + ":\_testing\xlarge-files"
$destination = $toDrive + ":\_testing\"


$xlarge = 0
Echo "Preparing Large Files"
$i = 0
DO {
  Copy-Item $xlargePath $destination -recurse -force
  $i++
} While ($i -lt $prepare)
Echo "Copying Large Files"
$i = 0
DO {
  Remove-Item $xlargePathDest -recurse -force
  $xlarge += Measure-Command { Copy-Item $xlargePath $destination -recurse -force } | select -expand TotalMilliseconds
  $i++
} While ($i -lt $measure)
$xlarge /= $measure

$large = 0
Echo "Preparing Large Files"
$i = 0
DO {
  Copy-Item $largePath $destination -recurse -force
  $i++
} While ($i -lt $prepare)
Echo "Copying Large Files"
$i = 0
DO {
  Remove-Item $largePathDest -recurse -force
  $large += Measure-Command { Copy-Item $largePath $destination -recurse -force } | select -expand TotalMilliseconds
  $i++
} While ($i -lt $measure)
$large /= $measure

$medium = 0
Echo "Preparing Medium Files"
$i = 0
DO {
  Copy-Item $mediumPath $destination -recurse -force
  $i++
} While ($i -lt $measure)
Echo "Copying Medium Files"
$i = 0
DO {
  Remove-Item $mediumPathDest -recurse -force
  $medium += Measure-Command { Copy-Item $mediumPath $destination -recurse -force } | select -expand TotalMilliseconds
  $i++
} While ($i -lt $measure)
$medium /= $measure

$small = 0
Echo "Preparing Small Files"
$i = 0
DO {
  Copy-Item $smallPath $destination -recurse -force
  $i++
} While ($i -lt $measure)
Echo "Copying Small Files"
$i = 0
DO {
  Remove-Item $smallPathDest -recurse -force
  $small += Measure-Command { Copy-Item $smallPath $destination -recurse -force } | select -expand TotalMilliseconds
  $i++
} While ($i -lt $measure)
$small /= $measure


Echo "" "Done" ""
Echo "xLarge: $xlarge ms"
Echo "Large: $large ms"
Echo "Medium: $medium ms"
Echo "Small: $small ms"

Pause
