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

dist:
	@echo "Creating a distribution file at ../RockeText.app"
	cp -r  /Applications/love.app ../RockeText.app
	cp -r  audio images lib main.lua ../RockeText.app/Contents/Resources/
	sed -i ../RockeText.app/Contents/Info.plist
