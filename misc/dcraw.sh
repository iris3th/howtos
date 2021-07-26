#convert cr2 to jpeg (ubuntu 20.04)
for i in *.CR2; do dcraw -c -w $i |cjpeg -quality 100 >jpeg/$i.jpg ;done
#resize images to digital photoframe
mogrify -resize 768x576 jpeg/*.jpg
#renames files 
a=202
for i in *.jpg; do
  new=$(printf "%04d.jpg" "$a") #04 pad to length of 4
  mv -i -- "$i" "$new"
  let a=a+1
done
