# 1. Whatever the size (assumes a big image), resize so the largest side is 2000
magick misael-moreno-1246168-unsplash.jpg -resize 2000x2000 resized.jpg

# 2. Crop into an 1080 square (need to be clearer on the position, will this work on landscape)?
magick resized.jpg -crop 1080x1080+0+460 cropped.jpg

# 3. Put logo into overlay
magick composite -compose atop -geometry +100+100 logo.png cropped.jpg with-logo.jpg
