PKG_MAN := apt-get
ENV_PKG := php apache2 
ENV_PKG += vim git curl pwgen apt-utils

WP_DIR  := /wordpress
MYSQL_PASSWD := `echo password`

env:
	$(PKG_MAN) install -y $(ENV_PKG)

vim:
	cd ~
	mkdir -p local/{bin,src}
	cd local/src
	git clone https://github.com/vim/vim.git
	cd vim/src
	./configure --prefix=$$HOME --enable-multibyte
	make && make install

mysql:
	@echo "mysql-server mysql-server/root_password password $(MYSQL_PASSWD)" | debconf-set-selections
	@echo "mysql-server mysql-server/root_password_again password $(MYSQL_PASSWD)" | debconf-set-selections
	$(PKG_MAN) install -y mysql-server
	@echo "----------------------------------------------"
	@echo "init MySQL root password : $(MYSQL_PASSWD)"
	@echo "----------------------------------------------"
	mysql_secure_installation


wordpress:
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	php wp-cli.phar --info
	chmod +x wp-cli.phar /usr/local/bin/wp

