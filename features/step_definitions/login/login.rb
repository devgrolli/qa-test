Dado('que acesse a página login') do
  step 'que acesse a página inicial'
  $trivia_page.home.acessar_login
end

Quando('preencher os dados para login {string}') do |login|
  @massa_dado = Manager.get_login(login)
  @login = $trivia_page.login
  @login.realizar_login(@massa_dado)
end

Quando('clico no botão de entrar') do
  @login.logar
end

Então('usuário deverá estar logado na aplicação') do
  expect(page).to have_content(/#{@massa_dado[:user].upcase}/i)
end

Quando('realizar login no site {string}') do |login|
  steps "
    Quando preencher os dados para login '#{login}'
    Quando clico no botão de entrar
    Então usuário deverá estar logado na aplicação
  "
end

Então('deverá exibir alerta de senha alterada com sucesso') do
  expect($trivia_page.home).to have_div_alert_sucesso
  expect(page).to have_content(/#{@massa_dado[:mensagem]}/i)
end
