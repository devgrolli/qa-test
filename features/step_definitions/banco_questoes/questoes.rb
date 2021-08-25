Dado('que navego para a página de busca do banco de questões') do
  @home.acessar_browse_questions
end

Dado('digito {string} no campo de busca') do |text_search|
  @browse = $trivia_page.browse
  @browse.buscar_questions(text_search)
end

Quando('clico no botão de buscar') do
  @browse.clicar_buscar
end

Então('visualizo uma mensagem de erro com o texto {string}') do |mensagem_error|
  expect($trivia_page.browse).to have_alert_error
  expect(page).to have_content(/#{mensagem_error}/i)
end

Quando('seleciono {string} como o tipo de busca') do |type_select|
  @browse.selecionar_type(type_select)
end

Então('deverá exibir {int} resultados da busca') do |numero_result|
  expect(@browse.contador_resultados).to eql(numero_result)
end

Então('visualizo o controle de paginação') do
  expect($trivia_page.browse).to have_paginate
end
