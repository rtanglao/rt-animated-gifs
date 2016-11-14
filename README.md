# Animated GIFs

## November 13, 2016

### 1.0 - make animated circular graph

* 1. ```mkdir 2016-11-13; cd !$```
* 2. ```cp ../2016-11-03/flickr-roland-2004-12-avgcolour.txt .```
* 3. ```brew install gnu-sed``` #sed on linux
* 4. ```gsed -i '1s/^/colour\n/' flickr-rolandraw.radial.line(0,1,deg= index, center=c(3,2), col= colours360[i,], expand = TRUE)d-2004-12-avgcolour.txt```

####  1.1 working counterclockwise code
 
 ```R
plot(0, xlim=c(1,5), ylim=c(1,5), main="", xlab="", ylab="", type="n", axes=F)
index = 0
for(i in 1:nrow(colours360)) {
  draw.radial.line(0,1,deg= index, center=c(3,2), col= colours360[i,], expand = TRUE)
  Sys.sleep(1.0)
  index = index + 1
}
```



## November 5, 2016

(continuing from the end of November 4)

* ```mkdir 1024x512```
* ```parallel "for i in {1..512};do cat {} >>1024x512/{.}.txt; done" ::: 1024line-chunks-flickr-roland-2004-12*```
* ```cd 1024x512```
* ```parallel "xxd -r -p {} {.}.rgb" ::: 1024line-chunks-flickr-roland-2004-12-avgcolour-*.txt``` # make rgb binary files
* ```parallel "gm convert -depth 8  -size 1024x512 {} {.}.png" ::: 1024line-chunks-flickr-roland-2004-12-avgcolour-*.rgb```
* ```gm convert -loop 50 -delay 20 *.png flickr2004-12-roland-avg-colour-barcode.gif``` #45MB too big for twitter
* ```gm convert -loop 50 -delay 20 -scale 512x256 *.png 512x256-flickr2004-12-roland-avg-colour-barcode.gif```
* I attempted to document [the above creation of an animated gif from November 3-5, 2016 in a blog post](http://rolandtanglao.com/2016/11/05/p1-How-to-make-animated-gif-average-colour-barcode-from-lots-of-photos/)

## November 4, 2016

(continuing from the end of November 3)

* somehow have to create a 1024x512 image so use gsplit (split on linux!)
* ```brew install coreutils```
* ```gsplit -a3 -l 1024 --numeric-suffixes=1  flickr-roland-2004-12-avgcolour.txt 1024line-chunks-flickr-roland-2004-12-avgcolour-``` # -a3 means 3 digits, -l 1024 means 1024 line chunks, --numeric-suffixes=1 means start at 1 instead of 0
* ```mkdir 1024FILES; cd !$```
* ```mv ../1024line-ch* .```
* ```for i in {1..512};do cat foo.txt >> bar.txt; done``` from http://superuser.com/questions/338616/linux-command-to-concatenate-a-file-to-itself-n-times, of course i would use parallel to do this :-) !

## November 3, 2016

WIP

* ```mkdir 2016-11-03```
* ```cd !$```
* ```./printAverageColourHexValueFromDirectory.rb /Users/rtanglao/Dropbox/Public/CCC/DATASETS/09April2012-ROLAND-103K-75x75-FLICKR-PHOTOS/75X75/FILES_SYM_LINKED_SEQUENTIALLY/ > flickr-roland-2004-12-avgcolour.txt ``` # convert 2004-2012 roland flickr thumbnails to average colour using scaling
* ```xxd -r -p flickr-roland-2004-12-avgcolour.txt flickr-roland-2004-12-avgcolour.raw``` #convert to binary file
* open in photoshop 3 channels 8 bits per channel and then save as flickr-roland-2004-12-avgcolour.png, output:<br />
<a data-flickr-embed="true"  href="https://www.flickr.com/photos/roland/30685511691/in/datetaken-ff/" title="flickr-roland-2004-12-avgcolour"><img src="https://c4.staticflickr.com/6/5823/30685511691_c1c6bc6138.jpg" width="372" height="271" alt="flickr-roland-2004-12-avgcolour"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

* next steps: read the image 1250 pixels at a time and use those pixels to make 86 50px x 25 px images and then make an animated gif

## October 23, 2016

* ```mkdir 2016-10-23```
* ```cd !$```
* ```cp /Users/rtanglao/Dropbox/GIT/2016-r-rtgram/JANUARY2016/colourname*.png .```
* ```ls -1 *.png >2016-january-piecharts.txt```
* ```gm convert -loop 50 -delay 20 -scale 1024x512 @2016-january-piecharts.txt 2016-january-instagram-vancouver-average-colour-piecharts``` 

## October 14, 2016

* ```mkdir 2016-10-14```
* ```cd !$```
* ```cp ~/Dropbox/GIT/rtgram/THUMBNAIL_150x150/BARCODE-1px-150px/2015_DAILY_BARCODES/*slices.png .```
* ```ls -1 *.png >2015-barcode-slices.txt```
* ```gm convert -loop 50 -delay 20 -scale 1024x512 @2015-barcode-slices.txt 2015-barcode.gif``` #dang 21 MB
* ```gm convert -resize 50% 2015-barcode.gif 50percent-2015-barcode.gif```

### Output

![instagram 2015 vancouver barcode](https://c1.staticflickr.com/9/8130/29696652433_d3ed551ca9_o_d.gif
 "instagram 2015 vancouver barcode")

## October 13, 2016

* ```mkdir 2016-10-13```
* ```cd !$```
* ```cp ~/Dropbox/PUBLIC/ROLAND_VANCOUVER_FLICKR/animatedHD.gif flickr-roland-2004-2012-animatedHD.gif``` # this file can be found at https://dl.dropboxusercontent.com/u/361757/ROLAND_VANCOUVER_FLICKR/animatedHD.gif in roland's Dropbox public folder
* ```gm convert -scale 1024x512 flickr-roland-2004-2012-animatedHD.gif 1024x512-flickr-roland-2004-2012-animatedHD.gif ``` # result is 45 MB, still too big!
* ```gm convert 1024x512-flickr-roland-2004-2012-animatedHD.gif -resize 50% 50percent-1024x512-flickr-roland-2004-2012-animatedHD.gif```

### Output

![twitter size flickr 2004-2012 thumbs arranged into hd frames](https://c1.staticflickr.com/9/8630/30312866925_431b8e7926_o_d.gif "twitter size flickr 2004-2012 thumbs arranged into hd frames")

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

