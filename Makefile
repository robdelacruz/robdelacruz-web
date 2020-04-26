all: site/index.html site/style.css

ppa:
	apt-get install curl python-software-properties
	curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
	sudo apt install nodejs

dep:
	sudo apt update
	sudo apt install curl software-properties-common
	curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
	sudo apt install nodejs
	sudo npm install -g npx

webtools:
	npm install tailwindcss
	npm install postcss-cli
	npm install cssnano --save-dev

addconf:
	sudo cp robdelacruz.com.conf /etc/nginx/sites-available/
	sudo cp reverse-proxy.conf /etc/nginx/sites-available/
	sudo ln -sf /etc/nginx/sites-available/robdelacruz.com.conf /etc/nginx/sites-enabled/robdelacruz.com.conf
	sudo ln -sf /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
	sudo service nginx restart

delconf:
	sudo unlink /etc/nginx/sites-enabled/robdelacruz.com.conf
	sudo unlink /etc/nginx/sites-enabled/reverse-proxy.conf
	sudo rm -f /etc/nginx/sites-available/robdelacruz.com.conf /etc/nginx/sites-available/reverse-proxy.conf

site/style.css: twsrc.css
	mkdir -p site
	npx tailwind build twsrc.css -o twsrc.o 1>/dev/null
	npx postcss twsrc.o > site/style.css

site/index.html: index.html
	mkdir -p site
	cp index.html site/

clean:
	rm *.o site/*

