
ubuntu-image snap my-model.model --snap ./gadget_analysis/pc_20-0.4_amd64.snap --snap lmbench-snap/lmbench-snap_0.1_amd64.snap -i 10G -O img1.img


sudo qemu-system-x86_64                                       \
   -smp 6                                                     \
   -m 6144                                                    \
   -net nic,model=virtio -net user,hostfwd=tcp::8022-:22      \
   -drive file=/usr/share/OVMF/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
   -drive file=img1.img,cache=none,format=raw,id=disk1,if=none\
   -device virtio-blk-pci,drive=disk1,bootindex=1             \
   -machine accel=kvm
