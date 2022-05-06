  Após a conexão ssh com

  ~~~ bash
  # ssh -p 8022 <user>@localhost
  $ ssh -p 8022 gth1ago@localhost
  ~~~
  
  Atualize os pacotes snap (opcional):
  
  ~~~ bash
  $ sudo snap refresh
  ~~~
  
  Agora iremos executar os testes do LMBench com o cenário consstruido do SNAP
  
  ~~~ bash
  $ cd /snap/lmbench-snap/current/opt/lmbench
  $ make
  ~~~
  
  Para verificar os resultados obtivos:
  ~~~ bash
  sudo cat /home/root/results/*
  ~~~
  
  Para o Download da pasta através da conexão SSH:
  ~~~ bash
  $ sudo scp <user>@host:/home/root/results/* .
  ~~~
  
  Com isso se tem os testes completos na máquina para análise.
  
