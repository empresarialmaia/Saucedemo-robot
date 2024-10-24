*** Settings ***
Documentation    Suite de testes automatizados para página de login saucedemo

Resource    ../resources/Base.resource

Test Setup       Iniciar testes
Test Teardown    Encerrar testes

*** Variables ***

${username}            standard_user 
${userblocked}         locked_out_user  
${userinvalid}         jfhdgsvxvxv
${password}            secret_sauce 


*** Test Cases ***
Realizar login com sucesso
    [Tags]    Login    smoke        
    Validar titulo Swag Labs    Swag Labs
    Realizar login              ${username}    ${password}     
    Validar login com sucesso   Products 

Realizar login com usuario bloqueado
    [Tags]    Login    invalid
    Validar titulo Swag Labs    Swag Labs
    Realizar login              ${userblocked}    ${password}     
    Validar mensagem de erro    Epic sadface: Sorry, this user has been locked out.

Realizar login com usuario em branco
    [Tags]    Login    invalid
    Validar titulo Swag Labs    Swag Labs
    Realizar login              ${EMPTY}    ${password}     
    Validar mensagem de erro    Epic sadface: Username is required

Realizar login com senha em branco
    [Tags]    Login    invalid
    Validar titulo Swag Labs    Swag Labs
    Realizar login              ${username}    ${EMPTY}     
    Validar mensagem de erro    Epic sadface: Password is required

Realizar login com usuario inválido
    [Tags]    Login    invalid
    Validar titulo Swag Labs    Swag Labs
    Realizar login              ${userinvalid}    ${password}     
    Validar mensagem de erro    Epic sadface: Username and password do not match any user in this service

Realizar logout
    [Tags]    Login    smoke   
    Validar titulo Swag Labs    Swag Labs
    Realizar login              ${username}    ${password}     
    Validar login com sucesso   Products 
    Clicar em logout
    Validar titulo Swag Labs    Swag Labs   

Realizar login com credenciais em branco
    [Tags]    Login    invalid
    Validar titulo Swag Labs    Swag Labs
    Realizar login              ${EMPTY}    ${EMPTY}     
    Validar mensagem de erro    Epic sadface: Username is required