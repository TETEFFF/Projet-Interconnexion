
## Comment ça marche
    
`docker-compose run` *// pour démarrer*  
`docker-compose down` *// pour arreter*  
`docker compose restart` *// pour redémarrer*  


> **Note:** *Il ce peut que vous devez installer la commande `docker-compose` sinon vous pouvez utiliser `docker compose` sans le **-***   


> **Important:** *Il ya eu des modifications pour quelques adresses du shéma : Docker n'aime pas quelques adresses jsp pourqouoi. Faites gaffe.*       

**Modifications des branches:** Il n'y a plus de branche interconnexion; c'est devenu la main. L'ancienne brarnche est devenue legacy    

**Pour les plages d'adresses privés *(Particulier, Entreprises primaire et secondaire)*:** Je les ai subdivisé car Docker n'aime pas quand il ya des chevauchements d'adresses 


**Verifying Network Configuration**

Inside containers 

`ip addr`

`ip route` // routing tables

`ping -c 3 <destination-ip>` // Test conectivity

