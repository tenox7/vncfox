docker rm -f vnc4bro

docker run --name vnc4bro -d -p 5900:5900 tenox7/vnc4bro:latest
