docker rm -f vncfox

docker run -d \
  --name vncfox \
  -v vncfox:/home/vncfox/.mozilla \
  -v /Volumes/Tmp:/home/vncfox/Downloads \
  -p 5900:5900 \
  -e WIDTH=1280 -e HEIGHT=1024 \
  tenox7/vncfox:latest
