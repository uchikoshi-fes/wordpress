PKG_MAN := apt-get
ENV_PKG := php apache2 
ENV_PKG += vim git curl

WP_DIR  := /wordpress

env:
	make mysql
	$(PKG_MAN) install -y $(ENV_PKG)

mysql:
	echo "mysql-server mysql-server/root_password password db_password" | debconf-set-selections
	echo "mysql-server mysql-server/root_password_again password db_password" | debconf-set-selections
	$(PKG_MAN) install -y mysql-server


wordpress:
	git clone --depth=1 https://github.com/WordPress/WordPress.git $(WP_DIR)
	chown -R www-data:www-data $(WP_DIR)/wp-content /var/www/html

