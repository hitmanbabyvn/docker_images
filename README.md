# Build Docker images
## Build ansible
	docker build -t ansible:v1 -f ansible/Dockerfile .

## Buuild vgs-laravel
	docker build -t vgs-laravel:v1 -f vgs-laravel/Dockerfile .
