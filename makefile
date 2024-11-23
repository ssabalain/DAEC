build:
	docker-compose --project-name daec up --build -d

up:
	docker-compose --project-name daec up -d

down:
	docker-compose down

dbt:
	docker exec -it dbt bash