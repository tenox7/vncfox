docker rm -f vncfox

docker run --name vncfox -v ~/.vncfox:/home/vncfox/.mozilla -d -p 5900:5900 tenox7/vncfox:latest
