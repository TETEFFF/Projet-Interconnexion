$TTL 1D
@       IN      SOA     ns1.groupe10.com. admin.groupe10.com. (
                        2023112801 ; serial
                        1D         ; refresh
                        1H         ; retry
                        1W         ; expire
                        3H )       ; minimum

@       IN      NS      ns1.groupe10.com.

ns1     IN      A       120.0.168.5           

monsupersite     IN      A       120.0.168.4

              
