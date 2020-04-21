all: site/index.html site/style.css

ppa:
	apt-get install curl python-software-properties
	curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
	sudo apt install nodejs

dep:
	apt update
	apt install npm
	npm install tailwindcss
	npm install npx
	npm install cssnano --save-dev
	npm install postcss-cli

addconf:
	cp robdelacruz.com.conf /etc/nginx/sites-available/
	cp reverse-proxy.conf /etc/nginx/sites-available/
	ln -sf /etc/nginx/sites-available/robdelacruz.com.conf /etc/nginx/sites-enabled/robdelacruz.com.conf
	ln -sf /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
	service nginx restart

delconf:
	unlink /etc/nginx/sites-enabled/robdelacruz.com.conf
	unlink /etc/nginx/sites-enabled/reverse-proxy.conf
	rm -f /etc/nginx/sites-available/robdelacruz.com.conf /etc/nginx/sites-available/reverse-proxy.conf

site/style.css: twsrc.css
	mkdir -p site
	npx tailwind build twsrc.css -o twsrc.o 1>/dev/null
	npx postcss twsrc.o > site/style.css

site/index.html: index.html
	mkdir -p site
	cp index.html site/

clean:
	rm *.o site/*

