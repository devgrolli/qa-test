# language:pt
@questoes @reg
Funcionalidade: Busca no Banco de Questões
  Eu como um usuário da aplicação
  Desejo realizar buscas no banco de questões
  Para encontrar questões

  @busca_not_found
  Cenário: Busca por questão inexistente
    Dado que acesse a página inicial
    E que navego para a página de busca do banco de questões
    E digito 'Science: Computers' no campo de busca
    Quando clico no botão de buscar
    Então visualizo uma mensagem de erro com o texto 'No questions found.'

  @busca_questions
  Cenário: Busca por questão com resultados
    Dado que acesse a página inicial
    E que navego para a página de busca do banco de questões
    E digito 'Science: Computers' no campo de busca
    E seleciono 'Category' como o tipo de busca
    Quando clico no botão de buscar
    Então deverá exibir 25 resultados da busca
    E visualizo o controle de paginação

  @cadastro_questions
  Esquema do Cenário: Cadastrar novas questões
    Dado que acesse a página login
    Quando preencher os dados para login 'login_default'
    E clico no botão de entrar
    E acessar a página de cadastro de questões
    E inserir os dados para nova questão '<temas>'
    Então questões deverão ser cadastradas com sucesso

    Exemplos:
      | temas    |
      | comics   |
      | vehicles |
