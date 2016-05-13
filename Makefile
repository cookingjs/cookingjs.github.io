dev:
	npm run dev

deploy:
	npm run deploy

push:
	git pull origin develop
	git add .
	git commit -m 'update doc'
	git push origin develop

pub: deploy push
