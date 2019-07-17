# instagram-image

Make an image like this for Instagram!

![sample](./assets/sample.jpg)

For more details, see:

https://hashrocket.com/blog/posts/generate-images-for-instagram

### Setup

```
$ git clone https://github.com/jwworth/instagram-image
$ cd instagram-image
$ gem install bundler
$ bundle
```

Install [ImageMagick](https://imagemagick.org/) via your method of choice.

### Webserver

```
$ ruby app.rb
```

Visit [http://localhost:4567](http://localhost:4567) and provide your data.
Break up a long title with newlines.

### CLI

Find a cool image on [Unsplash](https://unsplash.com). Copy it to the root of
this project. Then:

```
$ ruby ./cli generate --source your-file.jpg --title "Find your Ruby"
```

### License

This project is released under the MIT License.
