docker rm -f vncfox

docker run --name vncfox -v ~/.vncfox:/root/.mozilla -d -p 5900:5900 tenox7/vncfox:latest
