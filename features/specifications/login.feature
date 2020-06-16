#language: pt
@login
Funcionalidade: Login

Como usuário do site 
Preciso realizar o login
Para ter acesso a área logado do site

Cenário: Realizar login com sucesso
    Dado que tenha um usuário cadastrado
      E estou na página de login
    Quando realizar o login com dados válidos
    Então o login é realizado com sucesso
@wip
Cenário: Realizar login com dados inválido
    Dado estou na página de login
    Quando tentar realizar o login com os seguintes dados:
      | Email           | Password |
      |                 | 1234567  |
      | teste@          | 1234567  |
      | teste@teste.com | 1234546  |
      | teste@teste.com |          |
      | teste@teste.com | 1        |
      |                 |          |
    Então deve ser apresentado a seguinte mensagem de erro:
      | Mensagem                   |
      | An email address required. |
      | Invalid email address.     |
      | Authentication failed.     |
      | Password is required.      |
      | Invalid password.          |
      | An email address required. |