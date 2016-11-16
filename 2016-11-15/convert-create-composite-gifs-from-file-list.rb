#!/usr/bin/env ruby
require 'rubygems'
require 'json'
require 'pp'
require 'rmagick'

exit if ARGV.length != 1
files_to_composite = File.readlines(ARGV[0])
background_file =  files_to_composite[0].chomp
files_to_composite.each_with_index do |file, i|
  next if i == 0
  overlay_file = file.chomp
  $stderr.printf("overlay file:%s\n", overlay_file)
  $stderr.printf("background file:%s\n", background_file)

  begin
    #src_img =  Magick::Image.read(overlay_file).first # overlay is src, background is destination
    #$stderr.printf("overlay file read successfully\n")
    #dest_img =  Magick::Image.read(background_file).first
    #$stderr.printf("background file read successfully\n")
    # composite_img = dest_img.composite(src_img, 0, 0, Magick::OverlayCompositeOp)
  rescue Magick::ImageMagickError
    next
  end
  composite_img_filename = sprintf("convert-composite-prev-%7.7d-%s", i, overlay_file)
  `convert #{background_file} #{overlay_file} -composite #{composite_img_filename}`

  #composite_img.write(composite_img_filename)
  background_file = composite_img_filename
end
