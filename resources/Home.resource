*** Settings ***
Documentation    Métodos e ações da home

Library    Browser

*** Keywords ***

Validar produto desejado 
    [Arguments]    ${titulo_produto}    ${id_produto_desejado} 
    Wait For Elements State    ${id_produto_desejado}    visible    5
    Get Text                   ${id_produto_desejado}    equal    ${titulo_produto}    

Validar quantidade no carrinho
    [Arguments]    ${quantidade_add}
    Wait For Elements State     css=span[data-test="shopping-cart-badge"]    visible    5
    Get Text                    css=span[data-test="shopping-cart-badge"]    equal      ${quantidade_add}    

Selecionar produto da página
    [Arguments]     ${id_produto_desejado}   
    Wait For Elements State    ${id_produto_desejado}    visible    5 
    Click                      ${id_produto_desejado}

Remover todos os produtos do carrinho
    Wait For Elements State    css=span[data-test="shopping-cart-badge"]    visible    5     
    Click                      css=span[data-test="shopping-cart-badge"] 
    ${produtos}        Create List    remove-sauce-labs-backpack    remove-sauce-labs-boklkt-t-shirt   remove-sauce-labs-onesie    remove-sauce-labs-bike-light    remove-sauce-labs-fleece-jacket    remove-test.allTheThings()-t-shirt-(red) 
                                              
Selecionar tipo de ordenação    
    [Arguments]    ${tipo_ordenacao}
    Wait For Elements State    css=[class="product_sort_container"]    visible    5    
    Select Options By          css=[class="product_sort_container"]    text       ${tipo_ordenacao}