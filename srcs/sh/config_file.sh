IP=$(minikube ip)
cp srcs/pods/ftps/script srcs/pods/ftps/script-target
sed -i '' "s/##IP##/$IP/g" srcs/pods/ftps/script-target
cp srcs/pods/wordpress/wordpress_dump.sql srcs/pods/wordpress/wordpress_dump-target.sql
sed -i '' "s/##IP##/$IP/g" srcs/pods/wordpress/wordpress_dump-target.sql