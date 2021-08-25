Dado('que acesse a página inicial') do
  @home = $trivia_page.home
  @home.load
end
