all:
	docker compose --project-directory ./srcs up --build --detach

down:
	docker compose --project-directory ./srcs down
