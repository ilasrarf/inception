all:
	# @mkdir -p /tmp/wp /tmp/db
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up
