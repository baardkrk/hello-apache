.DEFAULT_GOAL := info

all: clean init approle up

info:
	$(info Targets are: all, up, clean, init, approle. Run target all to execute the targets in order.)

admin:
	$(info this target will create an admin policy)

up:
	touch my-app/conf/pyvars.env
	docker-compose up -d

init:
	touch my-app/conf/pyvars.env
	docker-compose up -d vault
	./.scripts/00-secrets.sh

approle:
	./.scripts/01-approle.sh

clean:
	touch my-app/conf/pyvars.env
	docker-compose down
	docker-compose down --volumes
	rm -f vault-agent/*role_id
	rm -f vault-agent/*secret_id
	rm -f my_website/public-html/diary-credentials.html
	rm -f my-app/conf/pyvars.env
	rm -f my-app/conf/pyconf.json
