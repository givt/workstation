all: update install

install:
	@./bin/workstation_bootstrap.sh

verbose:
	@echo "Bootstrapping ..."
	./bin/workstation_bootstrap.sh -v

update:
	@git pull
