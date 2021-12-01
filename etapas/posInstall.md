  Após a conexão ssh com

  ~~~ bash
  $ ssh -p 8022 gth1ago@localhost
  ~~~
  
  Atualize os pacotes snap com
  
  ~~~ bash
  $ sudo snap refresh
  ~~~
  
  Agora iremos instalar ã versão Classic do Snap para maiores possibilidades
  
  Detalhe = Versão classic so versão na versao 18 ubuntu core - mesmo com edge ainda há alguns problemas, e com isso por garantia será instalado a versão 16.04
  porém pode verificar qual desejar com:
  
  ~~~ bash
  $ sudo snap info classic
  ~~~
  
  Instalando com a versão de desenvolvedor:
  
  ~~~ bash
  $ sudo snap install classic --edge --devmode 
  ~~~
  
  Para verificar a instalação temos:
  ~~~ bash
  sudo snap list classic
  ~~~
  
  Para acessar a versão Classic, temos que acessar o seu modo então:
  ~~~ bash
  sudo classic
  ~~~
  
  
