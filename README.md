# Build Docker images

## Build ansible 
```bash
docker build -t ansible:v1 -f ansible/Dockerfile .
```

Run ansible
```bash
docker run -it ansible:v1
```

## Build vgs-email
```bash
docker build -t vgs-email:v1 -f vgs-email/Dockerfile.php56 .
```

Run vgs-email
```bash
docker run --name vgs1 --rm -d -v ${PWD}:/var/www/html vgs-email:v1
docker exec -it vgs1 bash
```

## Build vgs-laravel
```bash
docker build -t vgs-laravel:v1 -f vgs-laravel/Dockerfile .
```

Run vgs-laravel
```bash
docker run --name vgs2 --rm -d -v ${PWD}:/var/www/html vgs-laravel:v1
docker exec -it vgs2 bash
```

# Push image to Docker hub
```bash
docker images | grep ansible:v1
docker images | grep vgs-email:v1
docker images | grep vgs-laravel:v1

docker tag a2e67e13561a hitmanbabyvn/ansible:v1
docker push hitmanbabyvn/ansible:v1
...
```

