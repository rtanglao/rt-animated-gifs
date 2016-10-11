# Animated GIFs
## October 11, 2016
* ```ls -1 *.png > 1-31jan2016pngs.txt```
* oops twitter can't handle 1023x683 gifs, it can only handle 1024x512 wide therefore:
    * ```convert -loop 50 -delay 20 -scale 1024x512 @1-31jan2016pngs.txt 1024x512-imagemagick-01-31January2016-24squares-avgç-colour-per-hour.gif```
## October 10, 2016
* ```mkdir 2016-10-10; cd !$```
* ```cp ../../2016-r-rtgram/JANUARY2016/24SQUARES-PER-DAY/TRIMMED/24*.png .```
* from https://gist.github.com/rtanglao/6946128#file-animated_gif-sh
    * ```gm convert -loop 50 -delay 20 *.png 01-31January2016-24squares-avg-colour-per-hour.gif```
	
### Result

![01-31January2016-24squares-avg-colour-per-hour](https://c2.staticflickr.com/8/7563/30251809055_3b995995d0_o_d.gif "01-31January2016-24squares-avg-colour-per-hour")

