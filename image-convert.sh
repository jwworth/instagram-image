# 1. Whatever the size, resize so the largest side is 2000
magick "$1" -resize 2000x2000 output/resized.jpg

# 2. Crop into an 1080x1080 square (need to be clearer on the position, will
# this work on landscape)?
magick output/resized.jpg -crop 1080x1080+0+460 output/cropped.jpg

# 3. Darken image
magick convert output/cropped.jpg -fill black -colorize 40% output/darkened.jpg

# 4. Put logo into overlay
magick composite -compose atop -geometry +100+100 assets/logo.png output/darkened.jpg output/with-logo.jpg

# 5. Add Hashrocket logo
magick convert output/with-logo.jpg -fill white -font fonts/CircularStd-Book.otf -pointsize 100 -annotate +100+500 'Blog | Hashrocket' output/with-title.jpg

# 6. Add blog title
magick convert output/with-title.jpg -fill white -font fonts/CircularStd-Bold.otf -pointsize 100 -annotate +100+630 "$2" output/ready-for-instagram.jpg
