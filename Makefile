help:
	@echo "Targets:"
	@cat Makefile | grep -i '^[a-z]*:' | sed 's/^/    /' | sed 's/://'

home:
	open "https://github.com/sordina/"

issues:
	open "https://github.com/sordina/"

newissue:
	open "https://github.com/sordina/"

play:
	love .
