## Descrições dos modelos seguidos para elaborações


Acesse as [Etapas e definições do caminho](./etapas/etapas.md) para o desenvolvimento completo do ambiente de execuções

--------------------

> README ainda em construção

<!---
### Generic x86 / KVM - ubuntu-core-20
### Full x86 32/64 bit CPU virtualisation 

wget https://cdimage.ubuntu.com/ubuntu-core/20/stable/current/ubuntu-core-20-amd64.img.xz

# Next step: Install
# https://ubuntu.com/download/kvm

# Any device running Ubuntu Core is instantiated from an image. 
# Creating an Ubuntu Core image starts with a model assertion, a digitally signed text 
#   file with structured headers defining every aspect of the image.

# there are four principle snaps-types that combine to create the Ubuntu Core environment. 
# These are 
#   - kernel
#   - gadget
#   - base 
#   - snapd
# and all four need to be referenced within a model assertion.

# Building with ubuntu-image

sudo snap install ubuntu-image --beta --classic

# Custom model assertion ---- Ver


# The following will build an amd64 image using the ubuntu-core-20-amd64.model 
#  reference model assertion:

ubuntu-image snap ubuntu-core-20-amd64.model

# The output includes the img file itself, alongside a seed.manifest file 

# Testing an image
    
sudo qemu-system-x86_64 -smp 2 -m 2048                                            \
 -net nic,model=virtio                                                            \
 -net user,hostfwd=tcp::8022-:22                                                  \
 -drive file=/usr/share/OVMF/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
 -drive file=pc.img,cache=none,format=raw,id=disk1,if=none                        \
 -device virtio-blk-pci,drive=disk1,bootindex=1                                   \
 -machine accel=kvm

# With a successful boot, Ubuntu Core initialisation will ask for both 
#   networking parameters and an Ubuntu One account (see https://snapcraft.io/account).

# When the initialisation process has finished, and rebooted, you can SSH/

ssh -p 8022 <Ubuntu SSO user name>@localhost

# You are now connected to the Ubuntu Core
# To list which snaps are installed, for example, type ‘snap list’:

$ snap list

# To view the model assertion used to build the image:

$ snap model --assertion

# To output the serial assertion rather than the model assertion, type snap model --serial:

$ snap model --serial

# -----------------------------------------------------------------
date -Iseconds --utc
# Modif

unxz ubuntu-core-*

# After create my-model.json
# Have Signing a model assertion
# The difference between building an image from a reference model assertion and building from 
# a modified model assertion is that the modified model assertion needs to be digitally signed. 
# This is accomplished in four stages:
#   1 create a key
#   2 export/register the key
#   3 sign the model assertion
#   4 build the image

snap login

snap keys

# if no keys registered
snap create-key my-models

snap keys

snapcraft register-key
# Registering key ...
# Done. The key "my-models" (GvXDpIbG154qTRe3fBiObIH4puaC8yGR2mx3qDa83los3gIXTw0zusFQSDuE5O1d) may be used to sign your assertions.

# With a key created, use the snapcraft command to upload and register it with the store:

cat my-model.json | snap sign -k my-key-name > my-model.model

# The resulting my-model.model file contains the signed model assertion and can now be used to build the image.

# Building the image

sudo snap install ubuntu-image --beta --classic

# In gadget
snapcrapft '

# Para criar a Imagem
ubuntu-image snap my-model.model

# The ubuntu-image command will now build an image using locally sourced and built snaps, 
#   such as a custom gadget snap:

ubuntu-image snap my-model.model --snap ./pc_20-0.4_amd64.snap
-->


