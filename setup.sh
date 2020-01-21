#!/bin/sh

# Delete YAML
if [ "$1" = "delete" ]
then
    echo "\n\033[0;31mDeleting pods !\033[0m\n"
    kubectl delete -k srcs
	exit 1
fi

# Print dashboard
if [ "$2" = "only" ]
then
    # Print dashboard
    if [ "$1" = "dashboard" ]
    then
        clear
        echo "\n\n\033[0;35mDASHBOARD :\n\033[0m"
        kubectl get all
    fi
    # Print ip
    if [ "$1" = "ip" ]
    then
		MINIKUBE_IP=$(minikube ip)
        echo "\n\n                  Your ip is : \033[1;32m http://$MINIKUBE_IP \033[0m\n"
    fi
    # Print Password
    if [ "$1" = "password" ]
    then
		echo "\033[1;35m\n  |================|\033[0m"
		echo "\033[1;35m  |--  PASSWORD  --|\033[0m"
		echo "\033[1;35m  |________________|\033[0m"
        echo "\033[0;35m\n  --  \033[0;33mWordpress \033[0;35m--\n\033[0m"
        echo "\033[0;31madmin  \033[2;35m>\033[0m"
        echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32municorn\033[0m'  \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32municorn\033[0m'\n"
        echo "\033[0;34muser   \033[2;35m>\033[0m"
        echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32mjacens\033[0m'   \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32m123\033[0m'"
        echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32mnorminet\033[0m' \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32mpassword123\033[0m'"
        echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32mesteban\033[0m'  \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32mmotdepasse\033[0m'\n"
        echo "\033[0;35m\n  --    \033[0;33mMySQL    \033[0;35m--\n\033[0m"
        echo "\033[0;31madmin  \033[2;35m>\033[0m"
        echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32mroot\033[0m' \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32mpassword\033[0m'\n"
        echo "\033[0;34muser   \033[2;35m>\033[0m"
        echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32muser\033[0m' \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32mpassword\033[0m'\n"
        echo "\033[1;35m  -----------------\n\033[0m"
    fi
    exit 1
fi

# Ensure docker and minikube are installed
if ! which docker >/dev/null 2>&1 ||
    ! which minikube >/dev/null 2>&1
then
    echo "\033[1;31mPlease install Docker and Minikube\033[0m"
    exit 1
fi

# Ensure minikube is launched
if ! minikube status >/dev/null 2>&1
then
    echo "\033[1;33mMinikube is not started! Starting now...\033[0m\n"
    if ! minikube start --vm-driver=virtualbox \
        --cpus 3 --disk-size=30000mb --memory=4096mb
    then
        echo "\033[1;31mCannot start minikube!\033[0m"
        exit 1
    fi
    minikube addons enable metrics-server
    minikube addons enable ingress
fi

# Building images
MINIKUBE_IP=$(minikube ip)

cp srcs/ftps/entrypoint srcs/ftps/entrypoint-target
sed -i '' "s/##MINIKUBE_IP##/$MINIKUBE_IP/g" srcs/ftps/entrypoint-target
cp srcs/wordpress/wordpress_dump.sql srcs/wordpress/wordpress_dump-target.sql
sed -i '' "s/##MINIKUBE_IP##/$MINIKUBE_IP/g" srcs/wordpress/wordpress_dump-target.sql

echo "\n\033[1;34mStarting Services\033[0m\n"
eval $(minikube docker-env)

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

# Appli YAML
echo "\n\033[0;35mStarting pods !\033[0m\n"
kubectl apply -k srcs

# Print dashboard
if [ "$1" = "dashboard" ]
then
    clear
    echo "\n\n\033[0;35mDASHBOARD :\n\033[0m"
    kubectl get all
fi

# Print ip
if [ "$1" = "ip" ]
then
    echo "\n\n                  Your ip is : \033[1;32m http://$MINIKUBE_IP \033[0m\n"
fi

# Print Password
if [ "$1" = "password" ]
then
	echo "\033[1;35m\n  |================|\033[0m"
	echo "\033[1;35m  |--  PASSWORD  --|\033[0m"
	echo "\033[1;35m  |________________|\033[0m"
    echo "\033[0;35m\n  --  \033[0;33mWordpress \033[0;35m--\n\033[0m"
	echo "\033[0;31madmin  \033[2;35m>\033[0m"
	echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32municorn\033[0m'  \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32municorn\033[0m'\n"
	echo "\033[0;34muser   \033[2;35m>\033[0m"
	echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32mjacens\033[0m'   \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32m123\033[0m'"
	echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32mnorminet\033[0m' \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32mpassword123\033[0m'"
	echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32mesteban\033[0m'  \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32mmotdepasse\033[0m'\n"
	echo "\033[0;35m\n  --    \033[0;33mMySQL    \033[0;35m--\n\033[0m"
	echo "\033[0;31madmin  \033[2;35m>\033[0m"
	echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32mroot\033[0m' \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32mpassword\033[0m'\n"
	echo "\033[0;34muser   \033[2;35m>\033[0m"
	echo "\033[0;90m  - \033[0;36mname\033[0m \033[2;49m:\033[0m '\033[0;32muser\033[0m' \033[0;36mpwd\033[0m \033[2;49m:\033[0m '\033[0;32mpassword\033[0m'\n"
	echo "\033[2;35m  -----------------\n\033[0m"
fi