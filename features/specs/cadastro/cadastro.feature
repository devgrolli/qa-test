# language:pt
@cadastro @core
Funcionalidade: Cadastro de usuário
  Eu como um usuário da aplicação
  Desejo realizar buscas no banco de questões
  Para encontrar questões

  Contexto: 
    Dado que acesse a página inicial

  @cadastrar_usuario
  Cenário: Cadastrar um novo usuário no site
    E que acessa a página de cadastro
    Quando inserir os dados para cadastro de usuário
    E clicar em cadastrar
    Então deverá ser direcionado para a página inicial com a mensagem 'SUCCESS! You have been registered. Please verify your email address before logging in.'

  @cadastro_exeptions
  Esquema do Cenário: Validar erros ao tentar cadastrar usuário
    E que acessa a página de cadastro
    Quando inserir os dados para validar erro no cadastro '<type_error>'
    E clicar em cadastrar
    Então deverá exibir o alerta de erro ao tentar 'cadastrar'

    Exemplos:
      | type_error          |    
      | name_exists         |  
      | name_alphanumeric   |
      | different_passwords |
      | username_no_letter  |
      | short_password      |