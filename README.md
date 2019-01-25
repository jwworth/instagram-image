# instagram-image

Make an image for Instagram!

### Setup

```
$ git clone https://github.com/jwworth/instagram-image
$ cd instagram-image
$ gem install bundler
$ bundle
```

Install [ImageMagick](https://imagemagick.org/) via your method of choice.

### Usage

Find a cool image on [Unsplash](https://unsplash.com). Copy it to the root of
this project and name it `source.jpg`. Then:

```
$ ruby ./cli generate --source source.jpg --title "Find your Ruby"
```

Break up a long title with newlines.
