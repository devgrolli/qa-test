# language:pt
@login @reg
Funcionalidade: Login
  Eu como um usuário da aplicação
  Desejo realizar o login
  Para poder executar funções de usuário na aplicação

  @realizar_login
  Cenário: Realizar login na aplicação
    Dado que acesse a página login
    Quando preencher os dados para login 'login_default'
    E clico no botão de entrar
    Então usuário deverá estar logado na aplicação

  @login_exception
  Esquema do Cenário: Validar erros ao tentar logar na aplicação
    Dado que acesse a página login
    Quando preencher os dados para login '<type_exception>'
    E clico no botão de entrar
    Então deverá exibir o alerta de erro ao tentar 'logar'

    Exemplos:
      | type_exception       |
      | login_password_error |
      | login_confirm_email  |
