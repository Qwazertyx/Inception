#!bin/bash
cd /var/www/html/wordpress
# Download
wp core download --path=/var/www/html/wordpress --allow-root #--version=6.2.2
# Create config file wp-config.php with the appropriate database parameters (these are env variables in the .env file)
echo $DB_DATABASE 
wp config create --path=/var/www/html/wordpress --allow-root --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbprefix=wp_ --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASSWORD
# Install wordpress for our website (again, variables are in the .env file)
wp core install --path=/var/www/html/wordpress --allow-root --url=$DOMAIN_NAME --title="$SITE_TITLE" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL
wp plugin update --path=/var/www/html/wordpress --allow-root --all
# Create default user
wp user create --path=/var/www/html/wordpress --allow-root $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS
# Set the owner of the content of our site to www-data user and group
# For security reasons, we want to restrict who has access to these files
#chown www-data:www-data /var/www/html/wordpress/wp-content/uploads --recursive
chown -R www-data: /var/www/*
chmod -R 755 /var/www/html
mkdir -p /run/php/
php-fpm7.4 -F