# Build Docker images
## Build ansible 
	docker build -t ansible:v1 -f ansible/Dockerfile .
Run ansible
	docker run -it ansible:v1

## Buuild vgs-laravel
	docker build -t vgs-laravel:v1 -f vgs-laravel/Dockerfile .
Run vgs-laravel
	docker run --name vgs1 --rm -d -v ${PWD}:/var/www/html vgs-laravel:v1
	docker exec -it vgs1 bash

