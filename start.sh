# Création des Réseaux
docker network create Res_Coeur
docker network create Res_Acces_Clients
docker network create Res_Entreprise_Prim
docker network create Res_Particulier

# Création des Images de différents routeurs à partir du dockerfile Routeur 
# en passant le script correspondant en argument
docker build --file Routeur.dockerfile --build-arg SCRIPT_NAME=r_interco_1.sh -t image_r_interco_1 .
docker build --file Routeur.dockerfile --build-arg SCRIPT_NAME=r_entreprise.sh -t image_r_entreprise .


docker run -dit --name R_Interco_1 --cap-add=NET_ADMIN --cap-add=NET_RAW image_r_interco_1
docker run -dit --name R_Entreprise --cap-add=NET_ADMIN --cap-add=NET_RAW image_r_entreprise

# docker run -dit --name R_Interco_2 --cap-add=NET_ADMIN --cap-add=NET_RAW alpine sh
# docker run -dit --name R_Clients --cap-add=NET_ADMIN --cap-add=NET_RAW alpine sh
# docker run -dit --name Box --cap-add=NET_ADMIN --cap-add=NET_RAW alpine sh

# Ajout des Routeurs aux réseaux
docker network connect Res_Coeur R_Interco_1
# docker network connect Res_Coeur R_Interco_2
docker network connect Res_Coeur R_Entreprise
# docker network connect Res_Coeur R_Clients
#docker network connect Res_Entreprise_Prim R_Entreprise
# docker network connect Res_Acces_Clients R_clients
# docker network connect Res_Clients Box
# docker network connect Res_Particulier Box

