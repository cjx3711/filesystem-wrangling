# File Copy scripts

These are a bunch of file copy scripts that I used to test out the copy speeds from different hard drive formats.

[Here is the blog post detailing the process and results.](www.chaijiaxun.com/wrangling-with-filesystems)

`individual` contains the files that let me run the copy scripts individually.

`batch` runs all the scripts one after another.


## "Algorithm"

I suppose if you want the algorithm here it is.

1. Copy the files a few times. In case the disk is asleep or the OS is prioritising something else.
2. Copy and time the files n times. Delete the files before each copy.
3. Average the timings and display them.
