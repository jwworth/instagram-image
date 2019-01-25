# 1. Whatever the size (assumes a big image), resize so the largest side is 2000
magick misael-moreno-1246168-unsplash.jpg -resize 2000x2000 resized.jpg

# 2. Crop into an 1080 square (need to be clearer on the position, will this work on landscape)?
magick resized.jpg -crop 1080x1080+0+460 cropped.jpg

# 3. Darken image
magick convert cropped.jpg -fill black -colorize 40% darkened.jpg

# 4. Put logo into overlay
magick composite -compose atop -geometry +100+100 assets/logo.png darkened.jpg with-logo.jpg

# 5. Add Hashrocket logo
magick convert with-logo.jpg -fill white -font fonts/CircularStd-Book.otf -pointsize 100 -annotate +100+500 'Blog | Hashrocket' with-title.jpg

# 6. Add blog title
magick convert with-title.jpg -fill white -font fonts/CircularStd-Bold.otf -pointsize 100 -annotate +100+630 "Code + Music:\nA Handbook" ready-for-instagram.jpg
