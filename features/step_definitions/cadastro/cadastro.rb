Dado('que acessa a página de cadastro') do
  $trivia_page.home.acessar_login
  $trivia_page.login.acessar_page_cadastro
end

Quando('inserir os dados para cadastro de usuário') do
  @cadastro = $trivia_page.cadastro
  @cadastro.realizar_cadastro
end

Quando('clicar em cadastrar') do
  @cadastro.cadastrar_user
end

Então('deverá ser direcionado para a página inicial com a mensagem {string}') do |mensagem|
  expect($trivia_page.home).to have_div_page
  expect($trivia_page.home).to have_div_alert_sucesso
  expect(page).to have_content(/#{mensagem}/i)
end

Quando('inserir os dados para validar erro no cadastro {string}') do |type_error|
  @massa_dado = Manager.get_cadastro(type_error)
  @cadastro = $trivia_page.cadastro
  @cadastro.prencher_campos_exception(@massa_dado)
end

Então('deverá exibir o alerta de erro ao tentar {string}') do |action|
  action == 'cadastrar' ? (expect($trivia_page.cadastro).to have_div_cadastro) : (expect($trivia_page.login).to have_div_login)
  expect(page).to have_content(/#{@massa_dado[:mensagem]}/i)
  puts "Mensagem error: #{@massa_dado[:mensagem]}"
end
