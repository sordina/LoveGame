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
	@echo "TODO: Create a DMG - http://stackoverflow.com/questions/96882/how-do-i-create-a-nice-looking-dmg-for-mac-os-x-using-command-line-tools"
	rm  -r ../RockeText.app
	cp  -r /Applications/love.app ../RockeText.app
	zip -r ../RockeText.app/Contents/Resources/RockeText.love *
	cp     bundle/replacement.plist ../RockeText.app/Contents/Info.plist
	cp     images/RockeText.icns  ../RockeText.app/Contents/Resources/Love.icns
