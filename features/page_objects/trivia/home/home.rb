module PageTrivia
  module Home
    class Home < SitePrism::Page
      set_url '/'

      element :div_alert_sucesso, '.alert-success'
      element :div_page, '.img-responsive'
      element :btn_browse, '[class*="btn"] [class="fa fa-bars"]'
      element :btn_new_question, '[class*="btn"] [class="fa fa-plus"]'
      element :btn_login, '.fa-sign-in'

      element :input_current_password, '#password_current'
      element :input_new_password, '#password_new'
      element :input_new_password2, '#password_new_again'
      element :btn_reset_senha, '[type="submit"]'

      element :drop_down_menu_user, 'li[class="menu-item dropdown"]'
      elements :li_drop_down, 'li[class="menu-item dropdown"] [class="menu-item"]'

      def acessar_login
        btn_login.click
      end

      def acessar_browse_questions
        btn_browse.click
      end

      def acessar_new_questions
        btn_new_question.click
      end

      def acessar_page_dropdown_menu(tipo)
        drop_down_menu_user.hover
        num = case tipo
              when 'edit_questions' then 0
              when 'profile' then 1
              when 'password' then 2
              when 'logout' then 3
              end
        li_drop_down[num].click
      end

      def carregar_page
        wait_until_div_page_visible
        wait_until_btn_browse_visible
        wait_until_btn_login_visible
      end

      def alterar_senha(dados, type)
        senhas = type == 'alteracao' ? [dados[:senha], dados[:senha2]] : [dados[:senha2], dados[:senha]]
        input_current_password.set senhas[0].click
        input_new_password.set senhas[1].click
        input_new_password2.set senhas[1].click
        btn_reset_senha.click
      end
    end
  end
end
