all:
	@mkdir -p /home/vsedat/data
	@mkdir -p /home/vsedat/data/wordpress
	@mkdir -p /home/vsedat/data/mariadb
	@sudo docker-compose -f srcs/docker-compose.yml up -d --build

stop:
	@sudo docker-compose -f srcs/docker-compose.yml stop

re:	clean all

clean:	stop
	@sudo docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	@sudo rm -rf /home/vsedat/data/wordpress
	@sudo rm -rf /home/vsedat/data/mariadb
	@sudo docker system prune -af

.PHONY: all re stop clean fclean