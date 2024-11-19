# Supression de tous les conteneurs
docker stop $(docker ps -q)
docker rm $(docker ps -aq)

# Supression de tous les réseaux non utilisés par des conteneurs
docker network prune -f

