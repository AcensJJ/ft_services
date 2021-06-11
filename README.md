<p align="center">
    <img alt="42-lyon" src="https://user-images.githubusercontent.com/45235527/106354618-6ec65a00-62f3-11eb-8688-ba9e0f4e77de.jpg" />
</p>

# ft_services

<img alt="Note" src="https://user-images.githubusercontent.com/45235527/96753610-698e7080-13d0-11eb-9461-d3351c9208d7.png" width="250" height="200" />

### <strong>Description</strong>

Le projet consiste a mettre en place une infrastructure de différents services a l'aide de Kubernetes.

# Partie obligatoire

Vous allez aussi devoir mettre en place :
- Le dashboard web de <strong>Kubernetes</strong>. Celui-ci est utile pour gérer votre cluster.
- Un <strong>Load Balancer</strong> qui gère l’accès externe à vos services dans un cluster. C’est
uniquement lui qui vous servira pour exposer vos services. Vous devez garder les
ports propres aux services (IP `:3000` pour grafana etc).
- Un serveur <strong>Nginx</strong> ouvert sur les `ports 80 et 443`. Le `port 80` sera en <strong>http</strong> et devra
faire une redirection systématique de type `301` vers le `443`, qui sera lui en <strong>https</strong>.
La page affichée n’a pas d’importance.
- Un serveur <strong>FTPS</strong> ouvert sur le `port 21`.
- Un <strong>WordPress</strong> ouvert sur le `port 5050`, fonctionnant avec une base de données
<strong>MySQL</strong>. Les deux devront être dans deux containers distincts. Le wordpress devra
comporter *plusieurs utilisateurs* et *un administrateur*.
- <strong>PhpMyAdmin</strong>, tournant sur le `port 5000` et relié à la base de données <strong>MySQL</strong>.
- Un <strong>Grafana</strong>, accessible sur le `port 3000`, fonctionnant avec une base de données
<strong>InfluxDB</strong>. Celui-ci devra vous permettre de monitorer tous vos containers. Les
deux devront aussi être dans deux containers distincts. Vous devrez créer un dashboard par container.
- En cas de crash ou d’arrêt d’un des deux containers de base de données, vous
devrez vous assurer que celles-ci puissent persister et ne soient pas perdues. En
cas de suppression, les volumes où la data est sauvegardée doivent persister.
- Vous devrez vous assurer de pouvoir accéder à votre <strong>Nginx</strong> en connexion <strong>SSH</strong>.
- Chacun de vos containers devra pouvoir redémarrer automatiquement en cas de
crash ou d’arrêt d’un des éléments le composant.


# Documentation

Install ```helm``` / ```jq``` / ```docker``` / ```docker-machine``` / ```virtualbox``` / ```kubectl``` / ```minikube``` : <a href="https://github.com/AcensJJ/ft_services/blob/master/srcs/doc">Documentation</a>.

Git clone le projet et ```./setup.sh [$1 (delete / restart / ssh / minikube / dashboard / ip / password)] [$2 (only)] ``` dans le projet (ft_services).

- <strong>$1</strong> : 
  - ```delete``` : suppression des containers (no only possible)
  - ```restart``` : redemarrage de tout les containers (no only possible)
  - ```ssh``` : redirection vers le ssh
  - ```minikube``` : activation et redirection de l'interface minikube
  - ```dashboard``` : affichage des containers et de leur etat
  - ```ip``` : voir l'ip du serveur
  - ```password``` : afficher les mots de passe MySql et wordpress
  
- <strong>$2</strong>:
  - ```only``` : pour executer seulement le premier argument (seulement suprimé les containers, voir l'ip, etc...)

# Technologie

![Docker](https://user-images.githubusercontent.com/45235527/96755415-fd613c00-13d2-11eb-9e80-ca852dbd7cac.png) <img alt="Nginx" src="https://user-images.githubusercontent.com/45235527/96755516-1b2ea100-13d3-11eb-90a5-eef37dc45090.png" width="300" height="200" /> <img alt="Php" src="https://user-images.githubusercontent.com/45235527/96755596-36011580-13d3-11eb-8f1f-3d0df5ca7782.png" width="300" height="200" /> <img alt="Sql" src="https://user-images.githubusercontent.com/45235527/96755726-5e890f80-13d3-11eb-9c6b-5ac803a7a5fc.png" width="300" height="200" /> <img alt="Wordpress" src="https://user-images.githubusercontent.com/45235527/96755647-47e2b880-13d3-11eb-918f-e904e959f4f9.png" width="300" height="200" /> <img alt="Php my admin" src="https://user-images.githubusercontent.com/45235527/96904960-1d0e6800-1498-11eb-9ebf-beddaae4bb93.png" width="300" height="200" /> <img alt="Minikube" src="https://user-images.githubusercontent.com/45235527/103042867-453f4380-457b-11eb-8ce7-fc5eb8b99269.png" width="300" height="200" /> <img alt="grafana influxdb telegraf" src="https://user-images.githubusercontent.com/45235527/103042900-6738c600-457b-11eb-9009-4794fe3e5162.jpg" width="300" height="200" /> <img alt="helm" src="https://user-images.githubusercontent.com/45235527/103042921-7455b500-457b-11eb-8e08-e4e9a265c4a1.png" width="300" height="200" /> <img alt="Virtual box" src="https://user-images.githubusercontent.com/45235527/103042929-820b3a80-457b-11eb-8ea9-7381c4f22fb8.jpeg" width="300" height="200" />
