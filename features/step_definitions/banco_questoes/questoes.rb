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

Quando('acessar a página de cadastro de questões') do
  @home.acessar_new_questions
end

Quando('inserir os dados para nova questão {string}') do |temas|
  @question = case temas
              when 'comics' then Factory.comics_questions
              when 'vehicles' then Factory.cars_questions
              end
  @browse = $trivia_page.browse
  @browse.cadastrar_new_question(@question)
  @home.acessar_page_dropdown_menu('edit_questions')
end

Então('questões deverão ser cadastradas com sucesso') do
  expect(page).to have_content(/#{@question[:category]}/i)
  expect(page).to have_content(/#{@question[:type]}/i)
  expect(page).to have_content(/#{@question[:dificulty]}/i)
  expect(page).to have_content(/#{@question[:question]}/i)
  expect(page).to have_content(/#{@question[:corret]}/i)
  expect(page).to have_content(/#{@question[:incorrect]}/i)
end
