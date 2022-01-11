```
powershell -ExecutionPolicy Bypass online.ps1

convert \*.jpg my_pdf.pdf # All JPG files include in my_pdf.pdf file

sudo sed -i 's/^.*policy.*coder.*none.*PDF.\*//' /etc/ImageMagick-6/policy.xml  #if default imagemagick command not allows the above

for photo in *.jpg ; do convert $photo -rotate 90 $photo ; done #rotate all 90 degree cw


```
