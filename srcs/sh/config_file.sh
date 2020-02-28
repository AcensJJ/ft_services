IP=$(minikube ip)
cp srcs/ftps/ srcs/ftps/-target
sed -i '' "s/##IP##/$IP/g" srcs/ftps/-target
cp srcs/wordpress/wordpress_dump.sql srcs/wordpress/wordpress_dump-target.sql
sed -i '' "s/##IP##/$IP/g" srcs/wordpress/wordpress_dump-target.sql