**1. Requisitos**
   * QEMU
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

   * Habilitar KVM (Kernel Virtual Machine)
      - Verificar se seu processador possui capacidade para está virtualização
      vmx em Intel e sxm para AMD:
      ```bash
      $ sudo grep -cE 'vmx|svm' /proc/cpuinfo
      ```
      ```bash
      $ sudo modprobe kvm
      $ sudo kvm-ok
      ```
      Caso possui suporte e não esteja habilitado deve-se entrar na BIOS para habilitar!

      
   * Snap
      ```bash
      $ sudo apt install snapd
      ```
     * Ubuntu-image
      ```bash
      $ sudo snap install ubuntu-image --beta --classic
      ```

   * ssh
      ```bash
      $ sudo apt-get install SSH openssh-server
      ```

   * Ubuntu Core - img.xz
      ```bash
      $ wget https://cdimage.ubuntu.com/ubuntu-core/20/stable/current/ubuntu-core-20-amd64.img.xz
      ```
   * clone gadget amd64
      ```bash
      $ sudo apt install git
      $ git clone https://github.com/snapcore/pc-amd64-gadget.git
      ```

