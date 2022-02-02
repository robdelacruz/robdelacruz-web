all:

site:
	sudo cp -r robdelacruz.com /var/www/
	sudo cp -r robdelacruz.xyz /var/www/

addconf:
	sudo cp robdelacruz.com.conf /etc/nginx/sites-available/
	sudo cp robdelacruz.xyz.conf /etc/nginx/sites-available/
	sudo cp reverse-proxy.conf /etc/nginx/sites-available/
	sudo ln -sf /etc/nginx/sites-available/robdelacruz.com.conf /etc/nginx/sites-enabled/robdelacruz.com.conf
	sudo ln -sf /etc/nginx/sites-available/robdelacruz.xyz.conf /etc/nginx/sites-enabled/robdelacruz.xyz.conf
	sudo ln -sf /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
	sudo service nginx restart

delconf:
	sudo unlink /etc/nginx/sites-enabled/robdelacruz.com.conf
	sudo unlink /etc/nginx/sites-enabled/robdelacruz.xyz.conf
	sudo unlink /etc/nginx/sites-enabled/reverse-proxy.conf
	sudo rm -f /etc/nginx/sites-available/robdelacruz.com.conf
	sudo rm -f /etc/nginx/sites-available/robdelacruz.xyz.conf
	sudo rm -f /etc/nginx/sites-available/reverse-proxy.conf

