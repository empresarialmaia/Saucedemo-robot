*** Settings ***

Documentation    Base resource da automação site Saucedemo

Resource    ../resources/Login.resource
Resource    ../resources/Home.resource

*** Keywords ***        
Iniciar testes
    New Browser    chromium    headless=False
    New Page       https://www.saucedemo.com    
    


Encerrar testes    
    Take Screenshot
    Close Browser
        

