#!/bin/sh

# DEL
if [ "$1" = "delete" ]
then
	if ! minikube status >/dev/null 2>&1
		then
   		echo "\033[1;33mMinikube is not started!\033[0m\n"
		exit 1
	fi
    echo "\n\033[0;31mDeleting pods !\033[0m\n"
    kubectl delete -k srcs/pods
	exit 1
fi

# Dont reload
if [ "$2" = "only" ]
then
	if ! minikube status >/dev/null 2>&1
	then
   		echo "\033[1;33mMinikube is not started!\033[0m\n"
		exit 1
	fi
    if [ "$1" = "ssh" ]
    then
        sh srcs/sh/ssh.sh
    fi
    if [ "$1" = "minikube" ]
    then
        sh srcs/sh/minikube.sh
    fi
    if [ "$1" = "dashboard" ]
    then
        sh srcs/sh/dashboard.sh
    fi
    if [ "$1" = "ip" ]
    then
    	sh srcs/sh/ip.sh
    fi
    if [ "$1" = "password" ]
    then
		sh srcs/sh/password.sh
    fi
    exit 1
fi

# Check
if ! which docker >/dev/null 2>&1 ||
    ! which minikube >/dev/null 2>&1
then
    echo "\033[1;31mPlease install Docker and Minikube\033[0m"
    exit 1
fi
if ! minikube status >/dev/null 2>&1
then
    echo "\033[1;33mMinikube is not started! Starting now...\033[0m\n"
    if ! minikube start --vm-driver=virtualbox \
        --cpus 3 --disk-size=32500mb --memory=4096mb
    then
        echo "\033[1;31mCannot start minikube!\033[0m"
        exit 1
    fi
    sh srcs/sh/addons.sh
fi

# Config pods
IP=$(minikube ip)
sh srcs/sh/config_file.sh
sh srcs/sh/build_image.sh
echo "\n\033[0;35mStarting pods !\033[0m\n"
kubectl apply -k srcs/pods

# info
if [ "$1" = "dashboard" ]
then
    sh srcs/sh/dashboard.sh
fi
if [ "$1" = "password" ]
then
	sh srcs/sh/password.sh
fi
sh srcs/sh/ip.sh
if [ "$1" = "minikube" ]
then
	sh srcs/sh/minikube.sh
fi
if [ "$1" = "ssh" ]
then
    sh srcs/sh/ssh.sh
fi