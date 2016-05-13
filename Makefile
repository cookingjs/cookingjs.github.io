dev:
	npm run dev

push:
	git pull origin develop
	git add .
	git commit -m 'update doc'
	git push origin develop

deploy:
	npm run deploy

build:
	npm run build
