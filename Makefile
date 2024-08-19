NAME = inception

COMPOSE_FILE_PATH = ./srcs

all: 
	cd $(COMPOSE_FILE_PATH) && docker compose up

build : 
	cd $(COMPOSE_FILE_PATH) && docker compose build

down:
	cd $(COMPOSE_FILE_PATH) && docker compose down

clean:
	cd $(COMPOSE_FILE_PATH) && docker compose down --volumes --remove-orphans
