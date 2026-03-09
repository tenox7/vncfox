docker rm -f vncfox

docker run -d \
  --name vncfox \
  -v vncfox:/home/vncfox/.mozilla \
  -v /Volumes/Tmp:/home/vncfox/Downloads \
  -p 5900:5900 \
  -e WIDTH=1024 -e HEIGHT=768 \
  tenox7/vncfox:latest
