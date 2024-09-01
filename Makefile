docker-local:
	docker buildx build --platform linux/arm64 -t tenox7/vncfox:latest --load .

docker-push:
	docker buildx build --platform linux/amd64,linux/arm64 -t tenox7/vncfox:latest --push .

clean:
	docker rmi -f tenox7/vncfox:latest
	docker builder prune -a -f
	docker buildx prune -a -f

