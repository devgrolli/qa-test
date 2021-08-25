# language:pt

@questoes
Funcionalidade: Busca no Banco de Questões
  Eu como um usuário da aplicação
  Desejo realizar buscas no banco de questões
  Para encontrar questões

  Contexto: 
    Dado que acesse a página inicial

  @busca_not_found
  Cenário: Busca por questão inexistente
    Dado que navego para a página de busca do banco de questões
    E digito 'Science: Computers' no campo de busca
    Quando clico no botão de buscar
    Então visualizo uma mensagem de erro com o texto 'No questions found.'

  @busca_questions
  Cenário: Busca por questão inexistente
    Dado que navego para a página de busca do banco de questões
    E digito 'Science: Computers' no campo de busca
    E seleciono 'Category' como o tipo de busca
    Quando clico no botão de buscar
    Então deverá exibir 25 resultados da busca
    E visualizo o controle de paginação
