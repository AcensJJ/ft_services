# ft_services

![Screenshot 2020-10-21_19-05-33-326](https://user-images.githubusercontent.com/45235527/96753610-698e7080-13d0-11eb-9461-d3351c9208d7.png)

Description

Le projet consiste a mettre en place une infrastructure de différents services a l'aide de Kubernetes.


# Partie obligatoire

Vous allez aussi devoir mettre en place :
- Le dashboard web de Kubernetes. Celui-ci est utile pour gérer votre cluster.
- Un Load Balancer qui gère l’accès externe à vos services dans un cluster. C’est
uniquement lui qui vous servira pour exposer vos services. Vous devez garder les
ports propres aux services (IP :3000 pour grafana etc).
- Un serveur Nginx ouvert sur les ports 80 et 443. Le port 80 sera en http et devra
faire une redirection systématique de type 301 vers le 443, qui sera lui en https.
La page affichée n’a pas d’importance.
- Un serveur FTPS ouvert sur le port 21.
- Un WordPress ouvert sur le port 5050, fonctionnant avec une base de données
MySQL. Les deux devront être dans deux containers distincts. Le wordpress devra
comporter plusieurs utilisateurs et un administrateur.
- PhpMyAdmin, tournant sur le port 5000 et relié à la base de données MySQL.
- Un Grafana, accessible sur le port 3000, fonctionnant avec une base de données
InfluxDB. Celui-ci devra vous permettre de monitorer tous vos containers. Les
deux devront aussi être dans deux containers distincts. Vous devrez créer un dashboard par container.
- En cas de crash ou d’arrêt d’un des deux containers de base de données, vous
devrez vous assurer que celles-ci puissent persister et ne soient pas perdues. En
cas de suppression, les volumes où la data est sauvegardée doivent persister.
- Vous devrez vous assurer de pouvoir accéder à votre Nginx en connexion SSH.
- Chacun de vos containers devra pouvoir redémarrer automatiquement en cas de
crash ou d’arrêt d’un des éléments le composant.


# Resultat

`Bientot`


# Technologie

`Bientot`
