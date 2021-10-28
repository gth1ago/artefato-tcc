### Etapas para se executar o Ubuntu Core com parâmetros de inicialiações de Kernel

**1. [Requisitos](./etapas/requisitos.md)**
   * QEMU
   * Habilitar KVM
   * Snap
     * Ubuntu-image
   * ssh
   * Ubuntu Core - img.xz
   * clone gadget

**2. [Tratando download's](./etapas/tratando.md)**
   * Criação de conta para SNAP
   * Descomprimir img.xz

**3. [Configurações](./etapas/configuracoes.md)**
   * Criação do .json
   * snap login
   * snap keys
   * snap register key
   * Criação do .model com a key
   * Alteração do gadget

**4. [Execuções](./etapas/execucoes.md)**
   * snapcraft in gadget
   * ubuntu-image com snap criado
   * qemu com a imagem criada
   * login por ssh
  