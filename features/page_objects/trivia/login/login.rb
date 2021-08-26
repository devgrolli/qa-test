module PageTrivia
  module Login
    class Login < SitePrism::Page
      set_url '/'

      element :div_login, '.form-signin'
      element :input_name, '#username'
      element :input_password, '#password'
      element :btn_sign_in, '[type="submit"]'
      element :btn_register, '[class*="text-left"] a'
      element :div_alert_error, '.alert-danger'

      def realizar_login(dados)
        wait_until_div_login_visible
        input_name.set dados[:user]
        input_password.set dados[:senha]
      end

      def logar
        btn_sign_in.click
      end

      def acessar_page_cadastro
        btn_register.click
      end
    end
  end
end
