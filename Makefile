all:
	@mkdir -p /home/ilasrarf/data/wp /home/ilasrarf/data/db
	@docker-compose -f ./srcs/docker-compose.yml up --build -d
	
clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -a -q) || true
	@docker rmi $$(docker images -q) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm $(docker network ls -q) 2>/dev/null || true
	@sudo rm -rf /home/ilasrarf/data/wp /home/ilasrarf/data/db || true
