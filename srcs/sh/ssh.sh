echo "\n\033[0;35mSSH :\n\033[0m"
IP=$(minikube ip)
ssh -v root@$IP -p 21