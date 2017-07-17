$smallPath = $fromDrive + ":\_testing\small-files"
$smallPathDest = $toDrive + ":\_testing\small-files"
$mediumPath = $fromDrive + ":\_testing\medium-files"
$mediumPathDest = $toDrive + ":\_testing\medium-files"
$largePath = $fromDrive + ":\_testing\large-files"
$largePathDest = $toDrive + ":\_testing\large-files"
$xlargePath = $fromDrive + ":\_testing\xlarge-files"
$xlargePathDest = $toDrive + ":\_testing\xlarge-files"
$destination = $toDrive + ":\_testing\"

Echo "" "Starting $fromDrive to $toDrive..."

$xlarge = 0
$i = 0
DO {
  Copy-Item $xlargePath $destination -recurse -force
  $i++
} While ($i -lt $prepare)
$i = 0
DO {
  Remove-Item $xlargePathDest -recurse -force
  $xlarge += Measure-Command { Copy-Item $xlargePath $destination -recurse -force } | select -expand TotalMilliseconds
  $i++
} While ($i -lt $measure)
$xlarge /= $measure

$large = 0
$i = 0
DO {
  Copy-Item $largePath $destination -recurse -force
  $i++
} While ($i -lt $prepare)
$i = 0
DO {
  Remove-Item $largePathDest -recurse -force
  $large += Measure-Command { Copy-Item $largePath $destination -recurse -force } | select -expand TotalMilliseconds
  $i++
} While ($i -lt $measure)
$large /= $measure

$medium = 0
$i = 0
DO {
  Copy-Item $mediumPath $destination -recurse -force
  $i++
} While ($i -lt $measure)
$i = 0
DO {
  Remove-Item $mediumPathDest -recurse -force
  $medium += Measure-Command { Copy-Item $mediumPath $destination -recurse -force } | select -expand TotalMilliseconds
  $i++
} While ($i -lt $measure)
$medium /= $measure

$small = 0
$i = 0
DO {
  Copy-Item $smallPath $destination -recurse -force
  $i++
} While ($i -lt $measure)
$i = 0
DO {
  Remove-Item $smallPathDest -recurse -force
  $small += Measure-Command { Copy-Item $smallPath $destination -recurse -force } | select -expand TotalMilliseconds
  $i++
} While ($i -lt $measure)
$small /= $measure


Echo "" "Done: $fromDrive to $toDrive" ""
Echo "Small: $small ms"
Echo "Medium: $medium ms"
Echo "Large: $large ms"
Echo "xLarge: $xlarge ms"




