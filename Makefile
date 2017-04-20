PKG_MAN := apt-get
ENV_PKG := php apache2 
ENV_PKG += vim git curl pwgen apt-utils

WP_DIR  := /wordpress
MYSQL_PASSWD := password

env:
	$(PKG_MAN) install -y $(ENV_PKG)

mysql:
	$(eval MYSQL_PASSWD := $(shell pwgen -s 12 1))
	@echo "mysql-server mysql-server/root_password password $(MYSQL_PASSWD)" | debconf-set-selections
	@echo "mysql-server mysql-server/root_password_again password $(MYSQL_PASSWD)" | debconf-set-selections
	$(PKG_MAN) install -y mysql-server
	@echo "----------------------------------------------"
	@echo "init MySQL root password : $(MYSQL_PASSWD)"
	@echo "----------------------------------------------"
	mysql_secure_installation


wordpress:
	git clone --depth=1 https://github.com/WordPress/WordPress.git $(WP_DIR)
	chown -R www-data:www-data $(WP_DIR)/wp-content /var/www/html

