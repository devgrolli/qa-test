# Excecução dos teste 
- Execute o comando 'cucumber -t @reg'
# Excecução dos teste modo headless
- Execute o comando 'cucumber -t @reg BROWSER=chrome_headless'

# Descrição das tags de execução
* @reg = Roda todos os cenários
* @login = Roda toda a funcionalidade de login
* @questoes = Roda toda a funcionalidade de questões
* @cadastro = Roda toda a funcionalidade de cadastro