# Resize so the largest side is 2000
magick "$1" -resize 2000x2000 output/resized.jpg

# Crop (1080x1080)
magick output/resized.jpg -crop 1080x1080+0+460 output/cropped.jpg

# Darken image
magick convert output/cropped.jpg -fill black -colorize 40% output/darkened.jpg

# Superimpose logo
magick composite -compose atop -geometry +100+100 assets/logo.png output/darkened.jpg output/with-logo.jpg

# Add header
magick convert output/with-logo.jpg -fill white -font fonts/CircularStd-Book.otf \
  -pointsize 100 -annotate +100+500 'Blog | Hashrocket' output/with-title.jpg

# Add blog title
magick convert output/with-title.jpg -fill white -font fonts/CircularStd-Bold.otf \
  -pointsize 100 -annotate +100+630 "$2" output/ready-for-instagram.jpg
