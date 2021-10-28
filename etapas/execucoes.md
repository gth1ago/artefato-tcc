**4. Execuções**
   * **snapcraft in gadget**\
     Na pasta do seu gadget, execute como descrito no README do próprio:
     ~~~bash
     $ snapcraft 
     ~~~ 
     Com isso é criado um .snap na pasta atual.

     Caso ocorrar erros, verifique-se:
      - se há espaço para instalações (`$ dh -f`)
      - se possui permissão com o usuário atual para usar
        - snap
        - multipass
<br/>

   * **ubuntu-image com snap criado**\
    Criação da Imagem com o `.snap` e `.model` criado:
      ``` bash
      $ ubuntu-image snap my-model.model --snap ./pc_20-0.4_amd64.snap
      ``` 
      Com isso fora criado um `.img` sendo a imagem já modificada.
<br/>

   * **qemu com a imagem criada**\
    Para emulação com QEMU das imagens:
      ``` bash
      $ sudo qemu-system-x86_64                                     \
         -smp 2                                                     \
         -m 2048                                                    \
         -net nic,model=virtio -net user,hostfwd=tcp::8022-:22      \
         -drive file=/usr/share/OVMF/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
         -drive file=pc.img,cache=none,format=raw,id=disk1,if=none  \
         -device virtio-blk-pci,drive=disk1,bootindex=1             \
         -machine accel=kvm 
      ``` 
      em `-drive file <name.img>` deve-se referenciar a imagem que deseja, pode-se realizar com a .img original e a modificada (sem as mitigações).
<br/>

   * **login por ssh**\
    Após a execução e definição da conta no primeiro acesso, será logado e ofertado o acesso por ssh, em outro terminal então, acesse com:
   
      ```bash
      $ ssh -p 8022 <username>@localhost
      ```
  