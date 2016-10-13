# Animated GIFs

## October 12, 2016

* ```mkdir 2016-10-12```
* ```cd !$```
* ```convert -loop 50 -delay 20  @3000photos.txt 3000firstphotos-01-31January2016-avg-colour-per-hour.gif```
* OOOPS that makes 1024x768 we want 2:1 so use the ```-scale``` option
    * ```convert -loop 50 -delay 20  -scale 1024x512 @3000photos.txt 1024x512-scaled-3000firstphotos-01-31January2016-avg-colour-per-hour.gif```

### Output

![twitter size 01-31January2016-1st3000photos-avg-colour-per-hour](https://c2.staticflickr.com/8/7771/29661313004_98ffe1a6df_o_d.gif "twitter size 01-31January2016-1st3000photos-avg-colour-per-hour")

## October 11, 2016

* ```cd /Users/rtanglao/Dropbox/GIT/rt-animated-gifs/2016-10-10```
* ```ls -1 *.png > 1-31jan2016pngs.txt```
* oops twitter can't handle 1023x683 gifs, it can only handle 1024x512 wide therefore use ```-scale 1024x512```:
    * ```convert -loop 50 -delay 20 -scale 1024x512 @1-31jan2016pngs.txt 1024x512-imagemagick-01-31January2016-24squares-avgç-colour-per-hour.gif```

### Output

![twitter size 01-31January2016-24squares-avg-colour-per-hour](https://c2.staticflickr.com/6/5550/29638597234_dbb748ff10_o_d.gif "twitter size 01-31January2016-24squares-avg-colour-per-hour")
	
## October 10, 2016
* ```mkdir 2016-10-10; cd !$```
* ```cp ../../2016-r-rtgram/JANUARY2016/24SQUARES-PER-DAY/TRIMMED/24*.png .```
* from https://gist.github.com/rtanglao/6946128#file-animated_gif-sh
    * ```gm convert -loop 50 -delay 20 *.png 01-31January2016-24squares-avg-colour-per-hour.gif```
	
### Result

![01-31January2016-24squares-avg-colour-per-hour](https://c2.staticflickr.com/8/7563/30251809055_3b995995d0_o_d.gif "01-31January2016-24squares-avg-colour-per-hour")

