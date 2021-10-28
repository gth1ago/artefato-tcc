**1. Requisitos**
   * **QEMU**
      ``` bash
      $ sudo apt-get update
      $ sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager
      ``` 
      Adicione seu user ao grupo kvm e libvirt
      ``` bash
      $ sudo usermod -aG libvirt $USER
      $ sudo usermod -aG kvm $USER
      ``` 
      Verificar se o daemon libvirt foi iniciado
      ``` bash
      sudo systemctl is-active libvirtd
      ``` 
      Caso não:
      ``` bash
      $ sudo systemctl enable --now libvirtd
      ``` 

      Talvez seja necessário reiniciar a máquina
<br/>

   * **KVM (Kernel Virtual Machine)**
      - Habilitação do KVM
      - Primeiro verifique se seu processador possui capacidade para esta virtualização
      - `vmx` em Intel e `sxm` para AMD em `/proc/cpuinfo`:
      ```bash
      $ sudo grep -cE 'vmx|svm' /proc/cpuinfo
      ```
      Habilitando e verificando se está tudo ok:
      ```bash
      $ sudo modprobe kvm
      $ sudo kvm-ok
      ```
      Caso possui suporte e não esteja habilitado deve-se entrar na BIOS para habilitar!
<br/>
      
   * **Snap**
      ```bash
      $ sudo apt install snapd
      ```
     * Ubuntu-image
      ```bash
      $ sudo snap install ubuntu-image --beta --classic
      ```
<br/>

   * **SSH**
      ```bash
      $ sudo apt-get install SSH openssh-server
      ```
<br/>

   * **Ubuntu Core** - img.xz
      ```bash
      $ wget https://cdimage.ubuntu.com/ubuntu-core/20/stable/current/ubuntu-core-20-amd64.img.xz
      ```
<br/>

   * **Gadget** amd64
      ```bash
      $ sudo apt install git
      $ git clone https://github.com/snapcore/pc-amd64-gadget.git
      ```

