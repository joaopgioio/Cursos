*** Settings ***
Library           SeleniumLibrary
Library           String
Library           BuiltIn

*** Variables ***
${Browser}      firefox
${url}          http://automationpractice.com
&{USUARIO}      nome=JoaoPaulo  sobrenome=PatuciAlves
&{PESSOA}       nome=João Paulo  sobrenome=Patuci Alves  senha=200861  endereco=Rua Mascavo Acucar, 2k  cidade=São Pedro  estado=Alaska  cep=00000  pais=United States  celular=1111111111111  apelido=joaopgioio
@{PRODUTOS}     Summer Dresses  T-shirts  Blouses  Casual Dresses  Evening Dresses

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser   about:blank  ${Browser}

Fechar navegador
    Close Browser

#### Passo-a-Passo
Acessar a página home do site
    Go To    http://automationpractice.com
    Title Should Be   My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
    Input Text  id=search_query_top  ${PRODUTO}

Clicar no Botão Pesquisar
    Click Button  name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    wait until Element Is visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"Blouse")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    wait until Element Is visible   //*[@id="center_column"]//p[@class="alert alert-warning"]
    Element Text Should Be          //*[@id="center_column"]//p[@class="alert alert-warning"]   ${MENSAGEM_ALERTA}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    wait until Element Is visible    //*[@id="block_top_menu"]//a[@title="Women"]
    Mouse Over                       //*[@id="block_top_menu"]//a[@title="Women"]

Conferir se as sub categorias foram exibidas
    wait until Element Is visible    //*[@id="block_top_menu"]//ul[@class="submenu-container clearfix first-in-line-xs"]//a[@title="${PRODUTOS[0]}"][1]  10
    Page Should Contain Link         //*[@id="block_top_menu"]//ul[@class="submenu-container clearfix first-in-line-xs"]//a[@title="${PRODUTOS[0]}"][1]
    Page Should Contain Link         //*[@id="block_top_menu"]//ul[@class="submenu-container clearfix first-in-line-xs"]//a[@title="${PRODUTOS[1]}"]
    Page Should Contain Link         //*[@id="block_top_menu"]//ul[@class="submenu-container clearfix first-in-line-xs"]//a[@title="${PRODUTOS[2]}"]
    Page Should Contain Link         //*[@id="block_top_menu"]//ul[@class="submenu-container clearfix first-in-line-xs"]//a[@title="${PRODUTOS[3]}"][1]
    Page Should Contain Link         //*[@id="block_top_menu"]//ul[@class="submenu-container clearfix first-in-line-xs"]//a[@title="${PRODUTOS[4]}"][1]

Clicar na sub categoria "${SUBCATEGORIA}"
    Click Link                       //*[@id="block_top_menu"]//ul[@class="submenu-container clearfix first-in-line-xs"]//a[@title="${PRODUTOS[0]}"][1]

Conferir se foi exibida uma pagina com produtos da categoria "${SUBCATEGORIA}"
    Title Should Be                 Summer Dresses - My Store
    wait until Element Is visible   //*[@id="center_column"]/h1/span[@class="cat-name"][contains(text(), "${PRODUTOS[0]}")]
    Element Text Should Be          //*[@id="center_column"]//span[@class="category-name"][contains(text(), "${PRODUTOS[0]}")]   ${SUBCATEGORIA}
    Element Text Should Be          //*[@id="center_column"]//div[@class="rte"]                                                  Short dress, long dress, silk dress, printed dress, you will find the perfect dress for summer.
    Page Should Contain Image       xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/1/2/12-home_default.jpg"]
    Page Should Contain Link        //*[@id="center_column"]//a[@href="http://automationpractice.com/index.php?id_product=5&controller=product"][contains(text(), "Printed Summer Dress")]
    Page Should Contain Image       xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/1/6/16-home_default.jpg"]
    Page Should Contain Link        //*[@id="center_column"]//a[@href="http://automationpractice.com/index.php?id_product=6&controller=product"][contains(text(), "Printed Summer Dress")]
    Page Should Contain Image       xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/2/0/20-home_default.jpg"]
    Page Should Contain Link        //*[@id="center_column"]//a[@class="product-name"][contains(text(), "Printed Chiffon Dress")]

Conferir se o Produto "${PRODUTO}" foi listado
    wait until Element Is visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Element Text Should Be          //*[@id="center_column"]//span[@class="lighter"]   "T-SHIRT"
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/1/1-home_default.jpg"]
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"Faded Short Sleeve T-shirts")]
    Click Link                      xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"Faded Short Sleeve T-shirts")]

Clicar no botão "${BOTAO_ADDITEM}" do produto
    Title Should Be                 Faded Short Sleeve T-shirts - My Store
    Element Text Should Be          //*[@id="center_column"]//h1[@itemprop="name"]       Faded Short Sleeve T-shirts
    Click Button                    name=Submit

Checar se uma tela de confirmação foi exibida com a mensagem "${MENSAGEM_CONFIRMACAO}"
    wait until Element Is visible   css=#layer_cart > div.clearfix > div.layer_cart_product.col-xs-12.col-md-6 > h2 > i
    wait until Element Is visible   css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a > span
    Element Text Should Be          //*[@id="layer_cart"]//div[@class="layer_cart_product col-xs-12 col-md-6"]//h2   ${MENSAGEM_CONFIRMACAO}

Clicar no botão "${BOTAO_CHECKOUT}"
    Click Link                      //*[@id="layer_cart"]//a[@title="Proceed to checkout"]
    #Click Button                    title=Proceed to checkout

Checar se na tela do carrinho de compras os dados do produto foram adicionados e os devidos valores
    wait until Element Is visible   css=#cart_title
    Title Should Be                 Order - My Store
    Page Should Contain Image       //*[@class="cart_product"]//img[@src="http://automationpractice.com/img/p/1/1-small_default.jpg"]
    Page Should Contain Link        //*[@class="cart_description"]//p[@class="product-name"]//a[contains(text(), "Faded Short Sleeve T-shirts")]
    Element Text Should Be          //*[@class="cart_description"]//p[@class="product-name"]   Faded Short Sleeve T-shirts
    Element Text Should Be          //*[@class="price"]//span[@class="price"]   $16.51
    Page Should Contain Element     //*[@class="cart_quantity text-center"]//input[@type="text"]
    Element Text Should Be          //*[@class="cart_total"]//span[@class="price"]   $16.51
    Element Text Should Be          id=total_price     $18.51
    # Click Link                      //*[@id="center_column"]//a[@title="Proceed to checkout"]
    # Click Button                    name=processAddress
    # wait until Element Is visible   css=#carrier_area > h1
    # Page Should Contain Image       //*[@id="form"]//img[@src="/img/s/2.jpg"]
    # Checkbox Should Be Selected     name=cgv
    # Select Checkbox                 name=cgv
    # Click Button                    name=processCarrier
    # wait until Element Is visible   css=#center_column > h1
    # Click Link                      //*[@id="HOOK_PAYMENT"]//a[@title="Pay by check."]
    # Title Should Be                 My Store
    # wait until Element Is visible   css=#center_column > h1
    # wait until Element Is visible   css=#center_column > form > div > h3
    # Click Button                    type=submit

Clicar no ícone carrinho de compras no menu superior direito
    Click Link                      //*[@id="header"]//div[@class="shopping_cart"]//a[@href="http://automationpractice.com/index.php?controller=order"][@title="View my shopping cart"]

Conferir se a tela do carrinho de compras foi exibida
    wait until Element Is visible   css=#cart_title
    Title Should Be                 Order - My Store
    Page Should Contain Image       //*[@class="cart_product"]//img[@src="http://automationpractice.com/img/p/1/1-small_default.jpg"]
    Page Should Contain Link        //*[@class="cart_description"]//p[@class="product-name"]//a[contains(text(), "Faded Short Sleeve T-shirts")]

Clicar no botão de remoção de produtos (delete) no produto do carrinho
    Click Link                      //*[@title="Delete"]

Conferir a mensagem "${MENSAGEM_REMOCAOITEM}"
    wait until Element Is visible   css=#cart_title
    wait until Element Is visible   //*[@id="center_column"]//p[@class="alert alert-warning"]
    Element Text Should Be          //*[@id="center_column"]//p[@class="alert alert-warning"]   ${MENSAGEM_REMOCAOITEM}

Clicar no botão superior direito “${LOGIN}”
    Title Should Be                 My Store
    Click Link                      //*[@id="header"]//a[@class="login"]

Conferir se a página para fazer login foi exibida
    wait until Element Is visible   css=#center_column > h1
    Title Should Be                 Login - My Store

Gerar email válido
    ${TEXTO}                         Generate Random String
    Informar um e-mail válido  ${USUARIO.nome}  ${USUARIO.sobrenome}  ${TEXTO}

Informar um e-mail válido
    [Arguments]                     ${NOME_USUARIO}  ${SOBRENOME_USUARIO}  ${EMAIL_USUARIO}
    ${EMAIL_COMP}                   Set Variable  ${NOME_USUARIO}${SOBRENOME_USUARIO}${EMAIL_USUARIO}
    Wait Until Element Is Visible   id=email_create
    Input Text                      id=email_create    ${EMAIL_COMP}@testerobot.com
    Set Global Variable             ${EMAIL_COMP}
    #[Return]                        ${EMAIL_COMP}

Clicar no botão de "${CRIAR_CONTA}"
    wait until Element Is visible   id=SubmitCreate
    Click Button                    id=SubmitCreate
    wait until Element Is visible   //*[@id="create-account_form"]//div[@class="form-group form-ok"]

Conferir se a página com os campos de cadastro foi exibida
    wait until Element Is visible   css=#account-creation_form > div:nth-child(1) > h3
    Title Should Be                 Login - My Store
    Element Text Should Be          //*[@id="account-creation_form"]//h3[@class="page-subheading"][contains(text(), "Your personal information")]   YOUR PERSONAL INFORMATION

Preencher os campos obrigatórios
    Page Should Contain Radio Button  id=id_gender1
    Input Text                        id=customer_firstname       ${PESSOA.nome}
    Input Text                        id=customer_lastname        ${PESSOA.sobrenome}
    Input Password                    id=passwd                   ${PESSOA.senha}
    Input Text                        id=firstname                ${PESSOA.nome}
    Input Text                        id=lastname                 ${PESSOA.sobrenome}
    Input Text                        id=address1                 ${PESSOA.endereco}
    Input Text                        id=city                     ${PESSOA.cidade}
    wait until Element Is visible     //select[@id="id_state"]//option[contains(text(), "${PESSOA.estado}")]
    Select From List By Label         //select[@id="id_state"]    ${PESSOA.estado}
    Input Text                        id=postcode                 ${PESSOA.cep}
    Select From List By Label         //select[@id="id_country"]  ${PESSOA.pais}
    Input Text                        id=phone_mobile             ${PESSOA.celular}
    Input Text                        id=alias                    ${PESSOA.apelido}

Clicar em "${REGISTRAR}" para finalizar o cadastro
    wait until Element Is visible     id=submitAccount
    Click Button                      id=submitAccount

Conferir se a página de gerenciamento da conta foi exibida "${MENSAGEM_BEMVINDO}"
    wait until Element Is visible   css=#center_column > h1
    Title Should Be                 My account - My Store
    Element Text Should Be          //*[@id="header"]//a[@class="account"]  João Paulo Patuci Alves
    Element Text Should Be          //*[@id="center_column"]/p[@class="info-account"]  ${MENSAGEM_BEMVINDO}

Inserir o email válido e a "${SENHA}" e clicar em login
    Input Text                      id=email      ${EMAIL_COMP}@testerobot.com
    Input Password                  id=passwd     ${SENHA}
    Click Button                    name=SubmitLogin

Conferir se efetuamos o login e apresentou a mensagem "${MENSAGEM_BEMVINDO}"
    wait until Element Is visible   css=#center_column > h1
    Title Should Be                 My account - My Store
    Element Text Should Be          //*[@id="header"]//a[@class="account"]  João Paulo Patuci Alves
    Element Text Should Be          //*[@id="center_column"]/p[@class="info-account"]  ${MENSAGEM_BEMVINDO}

Clicar no usuário logado
   Click Link                       //*[@id="header"]//a[@class="account"]
   wait until Element Is visible    css=#center_column > h1
   Title Should Be                  My account - My Store
   Click Button                     title=Addresses
   Title Should Be                  Addresses - My Store
   wait until Element Is visible    css=#center_column > h1
   Click Link                       //*[@title="Delete"]
