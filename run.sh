docker rm -f vncfox

docker run --name vncfox -v vncfox:/home/vncfox/.mozilla -v /Volumes/Tmp:/home/vncfox/Downloads -d -p 5900:5900 tenox7/vncfox:latest
