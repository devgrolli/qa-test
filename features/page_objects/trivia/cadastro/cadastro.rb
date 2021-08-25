module PageTrivia
  module Cadastro
    class Cadastro < SitePrism::Page
      set_url '/'

      element :div_alert_sucesso, '.alert-success'
      element :div_cadastro, '.form-register'
      element :input_name, '#username'
      element :input_password, '#password'
      element :input_password_again, '#password_again'
      element :input_email, '#email'
      element :btn_cadastrar, '[class*="btn-block"]'

      def realizar_cadastro
        inserts = Factory.cadastro
        wait_until_div_cadastro_visible
        input_name.set inserts[:name]
        input_password.set inserts[:password]
        input_password_again.set inserts[:password]
        input_email.set inserts[:email]
      end

      def prencher_campos_exception(dados)
        input_name.set dados[:user]
        input_password.set dados[:password]
        input_password_again.set dados[:password_repeat]
        input_email.set dados[:email]
      end

      def cadastrar_user
        btn_cadastrar.click
      end
    end
  end
end
