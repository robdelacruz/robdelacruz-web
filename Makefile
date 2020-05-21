all:

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

