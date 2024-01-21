SHELL := /bin/bash


.PHONY : renew
renew :
	docker run --rm \
	  -v ./data/cloudflare.ini:/etc/cloudflare.ini:ro \
	  -v ./data/etc:/etc/letsencrypt \
	  -v ./data/log:/var/log/letsencrypt \
	  certbot/dns-cloudflare:latest \
	    renew --dns-cloudflare-propagation-seconds 60
	sudo chown -R $$(id -u $${USER}):$$(id -g $${USER}) ./data


.PHONY : v
v :
	docker run --rm certbot/dns-cloudflare:latest \
	  --version


.PHONY : issue/%
issue/% :
	docker run --rm \
	  -v ./data/cloudflare.ini:/etc/cloudflare.ini:ro \
	  -v ./data/etc:/etc/letsencrypt \
	  -v ./data/log:/var/log/letsencrypt \
	  certbot/dns-cloudflare:latest \
	    certonly -v \
	    --dns-cloudflare --dns-cloudflare-credentials /etc/cloudflare.ini \
	    --dns-cloudflare-propagation-seconds 60 \
	    -d *.$* -d $* \
	    --preferred-challenges dns-01
	sudo chown -R $$(id -u $${USER}):$$(id -g $${USER}) ./data
