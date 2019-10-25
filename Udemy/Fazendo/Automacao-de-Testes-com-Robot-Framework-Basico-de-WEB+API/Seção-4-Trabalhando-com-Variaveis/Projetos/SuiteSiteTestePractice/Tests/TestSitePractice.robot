*** Settings ***
Resource          ../resource/Resource.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador

### SETUP ele roda keyword antes da suitou antes de um teste
### TEARDOWN ele roda keyword depois de uma suite ou um teste

*** Test Case ***
Caso de Teste 01: Adicionar cliente
   Acessar a página home do site
   Clicar no botão superior direito “Sign in”
   Conferir se a página para fazer login foi exibida
   Gerar email válido
   #Informar um e-mail válido
   Clicar no botão de "Create na account"
   Conferir se a página com os campos de cadastro foi exibida
   Preencher os campos obrigatórios
   Clicar em "Register" para finalizar o cadastro
   Conferir se a página de gerenciamento da conta foi exibida "Welcome to your account. Here you can manage all of your personal information and orders."

Caso de Teste 02: Fazer login
  Acessar a página home do site
  Clicar no botão superior direito “Sign in”
  Conferir se a página para fazer login foi exibida
  Inserir o email válido e a "200861" e clicar em login
  Conferir se efetuamos o login e apresentou a mensagem "Welcome to your account. Here you can manage all of your personal information and orders."

Caso de Teste 03: Pesquisar produto existente
  Acessar a página home do site
  Digitar o nome do produto "Blouse" no campo de Pesquisar
  Clicar no Botão Pesquisar
  Conferir se o produto "Blouse" foi listado no site

Caso de Teste 04: Pesquisar produto não existente
  Acessar a página home do site
  Digitar o nome do produto "itemNãoExistente" no campo de Pesquisar
  Clicar no Botão Pesquisar
  Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

Caso de Teste 05: Listar produtos
  Acessar a página home do site
  Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
  Conferir se as sub categorias foram exibidas
  Clicar na sub categoria "Summer Dresses"
  Conferir se foi exibida uma pagina com produtos da categoria "Summer Dresses"

Caso de Teste 06: Adicionar e remover produtos ao carrinho
   Acessar a página home do site
   Clicar no botão superior direito “Sign in”
   Conferir se a página para fazer login foi exibida
   Inserir o email válido e a "200861" e clicar em login
   Digitar o nome do produto "t-shirt" no campo de Pesquisar
   Clicar no Botão Pesquisar
   Conferir se o Produto "t-shirt" foi listado
   Clicar no botão "Add to cart" do produto
   Checar se uma tela de confirmação foi exibida com a mensagem "Product successfully added to your shopping cart"
   Clicar no botão "Proceed to checkout"
   Checar se na tela do carrinho de compras os dados do produto foram adicionados e os devidos valores
   Clicar no ícone carrinho de compras no menu superior direito
   Conferir se a tela do carrinho de compras foi exibida
   Clicar no botão de remoção de produtos (delete) no produto do carrinho
   Conferir a mensagem "Your shopping cart is empty."

# Caso de Teste 07: Remover usuario
#    Acessar a página home do site
#    Clicar no botão superior direito “Sign in”
#    Conferir se a página para fazer login foi exibida
#    Inserir o "joaopgioio@gmail.com" válido e a "200861" e clicar em login
#    Conferir se efetuamos o login e apresentou a mensagem "Welcome to your account. Here you can manage all of your personal information and orders."
#    Clicar no usuário logado

# Caso de Teste 07: Remover produtos do carrinho
#     Acessar a página home do site
#     Clicar no botão superior direito “Sign in”
#     Conferir se a página para fazer login foi exibida
#     Inserir o "joaopgioio@gmail.com" válido e a "200861" e clicar em login
#     Clicar no ícone carrinho de compras no menu superior direito
#     Conferir se a tela do carrinho de compras foi exibida
#     Clicar no botão de remoção de produtos (delete) no produto do carrinho
#     Conferir a mensagem "Your shopping cart is empty."

# *** Keywords ***
