help:
	@echo "Targets:"
	@cat Makefile | grep -i '^[a-z]*:' | sed 's/^/    /' | sed 's/://'

home:
	open "https://github.com/sordina/LoveGame"

issues:
	open "https://github.com/sordina/LoveGame/issues"

newissue:
	open "https://github.com/sordina/LoveGame/issues/new"

play:
	love .
