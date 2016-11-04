#!/usr/bin/env ruby
# hacked from https://github.com/rtanglao/2016-rtgram/blob/master/printAverageColourHexValue.rb
require 'rubygems'
require 'json'
require 'pp'
require 'rmagick'
allowed_extensions = %w[.jpg .jpeg .png]
Dir.foreach(ARGV[0]) do |jpg_file|
  next if jpg_file == '.' or jpg_file == '..'
  next if !allowed_extensions.any?{ |ext| jpg_file.end_with?(ext) }
  $stderr.printf("file:%s\n", jpg_file)
  begin
    img =  Magick::Image.read(ARGV[0] + jpg_file).first
    $stderr.printf("file read successfully\n")
  rescue Magick::ImageMagickError
    next
  end
  pix = img.scale(1, 1)
  averageColor = pix.pixel_color(0,0)
  printf("#%2.2X%2.2X%2.2X\n", averageColor.red/257,
         averageColor.blue/257,  averageColor.blue/257)
end
