# language:pt
@login @core
Funcionalidade: Login
  Eu como um usuário da aplicação
  Desejo realizar buscas no banco de questões
  Para encontrar questões

  @logar
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

