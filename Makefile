all:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress
	docker compose --project-directory ./srcs up --build --detach
