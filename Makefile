deployconf:
	rm /etc/nginx/sites-enabled/robdelacruz.com.conf
	rm /etc/nginx/sites-enabled/reverse-proxy.conf
	cp robdelacruz.com.conf /etc/nginx/sites-available/
	cp reverse-proxy.conf /etc/nginx/sites-available/
	ln -s /etc/nginx/sites-available/robdelacruz.com.conf /etc/nginx/sites-enabled/robdelacruz.com.conf
	ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
	service nginx restart

