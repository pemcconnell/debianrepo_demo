.PHONY: help run ssh_demo ssh_repo

help:
	@echo "help - list commands"
	@echo "run - docker-compose up"
	@echo "ssh_repo - exec bash in the repo container"
	@echo "ssh_demo - exec bash in the demo container"

run:
	@docker-compose up

ssh_repo:
	@docker exec -ti aptlocal_repo bash

ssh_demo:
	@docker exec -ti aptlocal_demo bash
