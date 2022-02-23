#! /bin/bash
mkdir webapp && cd webapp
touch index.html && echo "<h1>Hello World!</h1>" > index.html
python3 -m http.server