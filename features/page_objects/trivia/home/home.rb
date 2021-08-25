module PageTrivia
  module Home
    class Home < SitePrism::Page
      set_url '/'

      element :div_alert_sucesso, '.alert-success'
      element :div_page, '.img-responsive'
      element :btn_browse, '[class*="btn"] [class="fa fa-bars"]'
      element :btn_new_question, '[class*="btn"] [class="fa fa-plus"]'
      element :btn_login, '.fa-sign-in'

      def acessar_login
        btn_login.click
      end

      def acessar_browse_questions
        btn_browse.click
      end

      def carregar_page
        wait_until_div_page_visible
        wait_until_btn_browse_visible
        wait_until_btn_login_visible
      end
    end
  end
end
