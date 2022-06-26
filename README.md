## build and run dev

docker-compose up -d --force-recreate --build --no-deps --remove-orphans ${service}

## push

docker image push ${image}

## run product

docker-compose -f docker-compose.product.yaml up -d node nginx redis