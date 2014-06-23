for f in *.jpg; do convert $f -strip -quality 85 -interlace line $f; done
