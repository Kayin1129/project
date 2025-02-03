nano /etc/nginx/sites-available/api
ln -s /etc/nginx/sites-available/api /etc/nginx/sites-enabled/
nginx -t
systemctl restart nginx
ls -l /etc/nginx/sites-available/api
nano /etc/nginx/sites-available/api
s -l /etc/nginx/sites-available/api
ls -l /etc/nginx/sites-available/api
sudo nano /etc/nginx/sites-available/api
udo rm /etc/nginx/sites-available/api
sudo rm /etc/nginx/sites-available/api
ls -l /etc/nginx/sites-available/api
nano /etc/nginx/sites-available/api
sudo nano /etc/nginx/sites-available/api
ln -s /etc/nginx/sites-available/api /etc/nginx/sites-enabled/
nginx -t
systemctl restart nginx
mkdir -p /var/www/api
cd /var/www/api
ufw allow OpenSSH
ufw allow 80
ufw allow 443
ufw enable
nano /var/www/api/index.php
chown -R www-data:www-data /var/www/api
systemctl restart nginx
php -v
systemctl status php8.3-fpm
fastcgi_pass unix:/run/php/php8.3-fpm.sock;
nano /etc/nginx/sites-available/api
fastcgi_pass unix:/run/php/php8.3-fpm.sock;
sudo rm /etc/nginx/sites-available/api
nano /etc/nginx/sites-available/api
server {
}
nginx -t
systemctl restart php8.3-fpm
systemctl restart nginx
