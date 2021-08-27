# Modulo para metodos
module PageTrivia
  # Chamada dentro dos modulos das Page
  class Pages
    class << self
      def home
        PageTrivia::Home::Home.new
      end

      def browse
        PageTrivia::Browse::Browse.new
      end

      def login
        PageTrivia::Login::Login.new
      end

      def cadastro
        PageTrivia::Cadastro::Cadastro.new
      end
    end
  end
end
