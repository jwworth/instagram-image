set -eu -o pipefail

# Resize, crop, darken
magick - \
  -resize 2000x2000 \
  -crop 1080x1080+0+460 \
  -fill black -colorize 40% \
  jpg:- |

# Superimpose logo
magick composite \
  -compose atop -geometry +100+100 \
  assets/logo.png \
  jpg:- jpg:- |

# Add header and title
magick convert \
  -fill white -font fonts/CircularStd-Book.otf \
  -pointsize 100 -annotate +100+500 'Blog | Hashrocket' \
  -fill white -font fonts/CircularStd-Bold.otf \
  -pointsize 100 -annotate +100+630 "$1" \
  jpg:- jpg:-
