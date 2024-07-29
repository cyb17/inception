<style>o{ color: orange }</style>

# Inception

<o>Machine virtuelle</o> : un environnement entierement virtualisee qui fonctionne sur une machine physique. Elle execute son propre OS et bénéficie de ses propres ressources materielles : CPU, mémoire RAM, disque dur et carte réseau.  
<o>Conteneur</o>: est une virtualition leger qui se passe au niveau du OS. Il permet 	d'encapsuler une application et toutes ses dependances dans un environnement isole et portable. Il utilise les fonctionnalites Namespaces et Cgroups du noyau de Linux.

- Namespaces : Fournissent l'isolation des environnements et des ressources, permettant à des processus de fonctionner comme s'ils étaient dans des systèmes séparés.
- Cgroups : Gèrent et limitent l'utilisation des ressources système pour des groupes de processus, garantissant une gestion efficace et équitable des ressources.

>Tous les deux permet l'isolement des applications et augmente sa portabilite. Cependant, un conteneur consomme moins de ressources et se demarrer bcp plus vite que le vm. Il est aussi plus facile a gerer grace a des outils d'orchestration comme Kubernetes et peut etre utilise sur tout les ordinateurs qui autorise le type de conteneur utilise.

![](./img.webp)

## Docker

<o>Docker</o> : plateforme de conteneurs lancee en 2013 qui permet de creer facilement des conteneurs et des applications bases sur des conteneurs. [Docker.docs](https://docs.docker.com/desktop/)  
<o>Docker Engine</o> : souvent abrege en Docker, une application a installer,c'est le moteur du systeme Docker permettant de regrouper et relie les differents composants entre eux.  
<o>Dockerfile</o> : fichier qui contient une serie d'instruction necessaire pour construire une image Docker.  
<o>Conteneur Docker</o> : une instance executable d'une image Docker.  
<o>Image Docker</o> : un paquet immuable contenant tout le nécessaire pour exécuter une application (code, bibliothèques, dépendances, fichiers de configuration)  
<o>Volume Docker</o> : un mecanisme pour conserver les données au-delà du cycle de vie d'un conteneur, une unite de stockage cree par Docker.  
<o>DockerHub</o> : registre officiel du Docker permet de trouver, utiliser et partager les images Docker.  
<o>Docker-compose.yml</o> : un fichier de configuration utilise par Docker Compose, ecrit en YAML.  
<o>Docker Compose</o> : un outil pour definir et gerer des environnements muti-conteneurs, permet de demarrer, arreter et configurer des ensembles de conteneurs ensemble. [En savoir plus](https://datascientest.com/docker-compose-tout-savoir)  

## CLI (Command Line Interface)



## Autres
<o>YAML</o> : un format de representation de donnees par serialisation (methode de codage d'une information en informatique) Unicode.  
<o>Alpine</o> : une distribution de Linux minimaliste et securisee, idéale pour les environnements conteneurisés, les systèmes embarqués et les serveurs minimalistes.  
<o>Debian</o> : une distribution Linux populair, open source et libre, developpe par une communaute de benevoles. Elle est stable, robuste et a une vaste depot de logiciels.  
<o>FastCGI</o> : mode ameliore du CGI original, est un protocole de communication qui permet au serveur web de communiquer efficacement avec des applications backend.  
<o>Php-fpm</o> : FastCGI Process Manager, une application backend du php, integrant le protocole FastCGI, qui maintien un nombre configure de processus pour executer des scripts php et ensuite etre reutilise une fois de nouveau livre, il permet de gerer plus efficacement l'execution des scripts PHP.  
>Le serveur et l'application backend se communique a l'aide du protocol FastCGI et d'une socket, en suivant le principe du client-serveur.

<o>Docker-network</o> :

WordPress :

MariaDB :


hacky-patch :

tail -f : 

daemons :

host, --link, links :

PID 1 :

latest :

Docker secret :

fichier .env :

port 443 :

redis-cache :

server FTP :

Adminer :

