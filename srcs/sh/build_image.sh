echo "\n\033[0;36mStarting nginx...\033[0m\n"
docker build -t custom-nginx:1.11 srcs/nginx
echo "\n\033[0;36mStarting ftps...\033[0m\n"
docker build -t custom-ftps:1.6 srcs/ftps
echo "\n\033[0;36mStarting wordpress...\033[0m\n"
docker build -t custom-wordpress:1.9 srcs/wordpress
echo "\n\033[0;36mStarting phpmyadmin...\033[0m\n"
docker build -t custom-phpmyadmin:1.1 srcs/phpmyadmin
echo "\n\033[0;36mStarting grafana...\033[0m\n"
docker build -t custom-grafana:1.0 srcs/grafana
echo "\n\033[0;36mStarting mysql...\033[0m\n"
docker build -t custom-mysql:1.11 srcs/mysql
echo "\n\033[0;34mStarting Services\033[0m"
echo "\n\033[1;32mOk !\033[0m\n"