*** Settings ***
Documentation    Suite de testes automatizados para página de home saucedemo

Resource    ../resources/Base.resource

Test Setup       Iniciar testes
Test Teardown    Encerrar testes

*** Variables ***
${username}            standard_user
${password}            secret_sauce
${Backpack}            id=add-to-cart-sauce-labs-backpack
${T-Shirt}             id=add-to-cart-sauce-labs-bolt-t-shirt
${Onesie}              id=add-to-cart-sauce-labs-onesie
${Bike_Light}          id=add-to-cart-sauce-labs-bike-light
${Jacket}              id=add-to-cart-sauce-labs-fleece-jacket
${T-Shirt-Red}         id=add-to-cart-test.allthethings()-t-shirt-(red)
${validando_prod}      xpath=//div[contains(text(), 'Sauce Labs Backpack')]

*** Test Cases ***
Acessar homepage
    Validar titulo Swag Labs    Swag Labs
    Realizar login    ${username}     ${password}
    Validar login com sucesso    Products 

Adicionar produto no carrinho
    Validar titulo Swag Labs      Swag Labs
    Realizar login                ${username}     ${password}
    Validar login com sucesso     Products
    Validar produto desejado      Sauce Labs Backpack     ${validando_prod} 
    Selecionar produto da página    ${Backpack}
    Validar quantidade no carrinho    1

Selecionar todos os produtos   
    Validar titulo Swag Labs    Swag Labs 
    Realizar login    ${username}     ${password}
    Validar login com sucesso    Products
    Validar produto desejado     Sauce Labs Backpack     ${validando_prod} 
    Selecionar produto da página    ${Backpack}   
    Selecionar produto da página    ${T-Shirt} 
    Selecionar produto da página    ${Onesie} 
    Selecionar produto da página    ${Bike_Light} 
    Selecionar produto da página    ${Jacket}  
    Selecionar produto da página    ${T-Shirt-Red} 
    Validar quantidade no carrinho    6

Ordenar produtos de Z to A
    Validar titulo Swag Labs    Swag Labs 
    Realizar login    ${username}     ${password}
    Validar login com sucesso       Products
    Take Screenshot
    Selecionar tipo de ordenação    Name (Z to A)
    Take Screenshot    

Ordenar preços do mais baixo ao mais alto
    Validar titulo Swag Labs    Swag Labs 
    Realizar login    ${username}     ${password}
    Validar login com sucesso       Products
    Take Screenshot
    Selecionar tipo de ordenação    Price (low to high)
    Take Screenshot

Ordenar preços de mais alto pro mais baixo
    Validar titulo Swag Labs    Swag Labs 
    Realizar login    ${username}     ${password}
    Validar login com sucesso       Products
    Take Screenshot
    Selecionar tipo de ordenação    Price (high to low)
    Take Screenshot