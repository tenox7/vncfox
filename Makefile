docker:
	docker build -t tenox7/vnc4brows .

clean:
	docker rmi -f tenox7/vnc4brows
	docker builder prune -a