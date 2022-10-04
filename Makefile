all:
	docker compose --project-directory ./srcs up --build

down:
	docker compose --project-directory ./srcs down
