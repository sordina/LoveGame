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
	@echo "Creating distribution files in ./rocketext - ./rocketext/RockeText.app ./rocketext/rocketext.dmg"
	@echo "TODO: Create a DMG - http://stackoverflow.com/questions/96882/how-do-i-create-a-nice-looking-dmg-for-mac-os-x-using-command-line-tools"
	rm  -rf rocketext/
	mkdir   rocketext
	cp  -r  /Applications/love.app ./rocketext/RockeText.app
	zip -r  ./rocketext/RockeText.app/Contents/Resources/RockeText.love audio lib main.lua
	cp      bundle/replacement.plist ./rocketext/RockeText.app/Contents/Info.plist
	cp      images/RockeText.icns ./rocketext/RockeText.app/Contents/Resources/Love.icns
	hdiutil  create ./rocketext/RockeText.dmg -srcfolder ./rocketext/ -ov
	@echo "Distribution Created in ./rocketext/"

upload:
	s3cmd put --acl-public rocketext/RockeText.dmg s3://rocketext/RockeText.dmg
