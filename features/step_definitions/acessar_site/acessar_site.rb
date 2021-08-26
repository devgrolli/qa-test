Dado('que acesse a página inicial') do
  @home = $trivia_page.home
  @home.load
  @home.carregar_page
end
