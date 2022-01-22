**4. Execuções**
   * **snapcraft in gadget**\
     Na pasta do seu gadget, execute como descrito no README do próprio:
     ~~~bash
     $ snapcraft 
     ~~~ 
     Utilize do "y" após executar para download e uso do gerenciador "Multipass".
     
     Com isso é criado um `.snap` na pasta atual.

     Caso ocorra erros, verifique-se:
      - se há espaço para instalações 
      ~~~bash 
         $ df -H
      ~~~
      - se possui permissão com o usuário atual para usar
        - snap
        - multipass
        ~~~bash
        $ sudo chmod a+w /var/snap/multipass/common/multipass_socket
        ~~~
      - caso erro "An error occurred with the instance when trying to launch with 'multipass'":
        ~~~bash
        $ multipass launch
        ~~~
      - caso deseje limpar para melhor correção completa, use:
      ~~~bash
         $ snapcraft clean 
      ~~~ 
      
      Com a execução finalizada com sucesso, tera criado o .snap desejado
<br/>

   * **ubuntu-image com snap criado**
   
      ubuntu-image é uma ferramenta utilizada para a criação de imagens pré-instaladas do Ubuntu, tanto clássicas quanto baseadas em snap o qual é o nosso caso.
   
      Criação da Imagem com o `.snap` e `.model` criado:
      
      ~~~ bash
      # ubuntu-image snap <name.model> --snap ./<name>.snap
      $ ubuntu-image snap my-model.model --snap ./gadget_analysis/pc_20-0.4_amd64.snap --snap lmbench-snap/lmbench-snap_0.1_amd64.snap -i 10G
      ~~~ 
      
      Com isso fora criado um `.img` sendo a Imagem já modificada.
      Pode-se ver informações da imagem com:
      
      ~~~ bash
      $ qemu-img info pc.img
      # e para redimenciona o tamanho com:
      $ qemu-img resize pc.img 6G
      ~~~ 
<br/>

   * **qemu com a imagem criada**\
    Para emulação com QEMU das imagens:
    
      ~~~ bash
      $ sudo qemu-system-x86_64                                     \
         -smp 2                                                     \
         -m 2048                                                    \
         -net nic,model=virtio -net user,hostfwd=tcp::8022-:22      \
         -drive file=/usr/share/OVMF/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
         -drive file=pc.img,cache=none,format=raw,id=disk1,if=none  \
         -device virtio-blk-pci,drive=disk1,bootindex=1             \
         -machine accel=kvm 
      ~~~ 
      
      em `-drive file <name.img>` deve-se referenciar a imagem que deseja, pode-se realizar com a .img original e a modificada (sem as mitigações).
<br/>

   * **login por ssh**\
    Após a execução e definição da conta no primeiro acesso, será logado e ofertado o acesso por ssh, em outro terminal então, acesse com:
   
      ~~~bash
      # ssh -p <porta> <user>@localhost
      $ ssh -p 8022 gth1ago@localhost
      ~~~
  
  Continua com a [pós instalação](./posInstall.md)

