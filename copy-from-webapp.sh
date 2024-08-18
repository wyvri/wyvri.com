#!/bin/bash
source_url="https://wyvri.pythonanywhere.com"

curl https://wyvri.pythonanywhere.com/ > index.html
curl https://wyvri.pythonanywhere.com/static/style.css > static/style.css
curl https://wyvri.pythonanywhere.com/aboutme/ > aboutme/index.html
curl https://wyvri.pythonanywhere.com/gallery/ > gallery/index.html

for img in $( grep src gallery/index.html | sed 's/.*src="//' | sed 's/".*//' ); do
   echo $img "..."
   curl $source_url$img > ".$img"
done