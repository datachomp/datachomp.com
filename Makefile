PROJECTNAME=$(shell basename "$(PWD)")
CURRENT_DIR := $(shell pwd)

## serve: serve the application
serve:
	jekyll serve

.PHONY: test
## test: run tests
test:
	jekyll test

## deploy: deploy the app
deploy:
	git push origin main

help: Makefile
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
