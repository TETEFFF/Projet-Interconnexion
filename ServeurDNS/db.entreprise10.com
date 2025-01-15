$TTL 1D
@       IN      SOA     ns1.entreprise10.com. admin.entreprise10.com. (
                        2023112801 ; serial
                        1D         ; refresh
                        1H         ; retry
                        1W         ; expire
                        3H )       ; minimum

@       IN      NS      ns1.entreprise10.com.

ns1     IN      A       120.0.168.5           


www      IN      A       120.0.168.4

              
mail    IN      A       120.0.168.10

@       IN      MX 10   mail.entreprise10.com.

@       IN    TXT  "v=spf1 mx -all"