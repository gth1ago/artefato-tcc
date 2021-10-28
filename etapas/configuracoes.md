**3. Configurações**
   * **Criação do .json**
<br/>

   * **snap login**\
      Pelo terminal, faça o login com a conta criada em [Snapcraft](https://snapcraft.io/account)
      ```bash
      $ snap login
      ```
<br/>

   * **snap keys**\
      Necessário uma chave para integridade no uso nas imagens 
     - Verifique com:
      ```bash
      $ snap keys
      ```
      Caso não houver chaves criadas, crie com:
      ```bash
      # snap create-key <nome-da-chave>
      $ snap create-key <my-models>
      ```
<br/>

   * **snap register key**\
      Agora para registrar sua chave a sua conta no Snap
      ```bash
      $ snap register key
      ```
<br/>

   * **Criação do .model com a key**\
      ```bash
      $ cat my-model.json | snap sign -k my-key-name > my-model.model
      ```
      Há então a criação do arquivo my-model.model, o qual contem o modelo assinado para inserção  e deve-se ser usado para construção da imagem.
<br/>

   * **Alteração do gadget**\
      No gadget, para passagem de parâmetros ao kernel na inicialização deve-se usar os gadget e definir um novo arquivo cmdline.extra com os parâmetros e definir no .yarn a sua adição.

      ```bash
      $ echo "mitigations=off" > ./<caminho>/cmdline.extra
      ```
      - Em `gadget.yaml` adicione as seguintes linhas na sessão do grub, abaixo do `- grub-common`:
      ```yaml
      build-packages:
      - grub-common
      override-build: |
         snapcraftctl build
         cp cmdline.extra $SNAPCRAFT_PART_INSTALL/
      ```