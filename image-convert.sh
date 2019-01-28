# Resize, crop, darken
magick "$1" \
 -resize 2000x2000 \
 -crop 1080x1080+0+460 \
 -fill black -colorize 40% \
 output/resized-cropped-darkened.jpg

# Superimpose logo
magick composite \
  -compose atop -geometry +100+100 \
  assets/logo.png output/resized-cropped-darkened.jpg \
  output/with-logo.jpg

# Add header and title
magick convert \
  output/with-logo.jpg \
  -fill white -font fonts/CircularStd-Book.otf \
  -pointsize 100 -annotate +100+500 'Blog | Hashrocket' \
  -fill white -font fonts/CircularStd-Bold.otf \
  -pointsize 100 -annotate +100+630 "$2" output/ready-for-instagram.jpg
