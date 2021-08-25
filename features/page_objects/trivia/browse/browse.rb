module PageTrivia
  module Browse
    class Browse < SitePrism::Page
      set_url '/'

      element :paginate, '.pagination'
      element :alert_error, '.alert-danger'
      element :btn_browse, '[class*="btn"] [class="fa fa-bars"]'
      element :btn_new_question, '[class*="btn"] [class="fa fa-plus"]'
      element :btn_login, 'fa fa-sign-in'
      element :input_query_browse, '#query'
      element :btn_search, '[role="button"]'
      elements :select_type, '#type option'
      elements :table_linhas, 'table tbody tr'

      def acessar_login
        wait_until_btn_login_visible
        btn_login.click
      end

      def selecionar_type(type_select)
        select_type.select { |type| type.click if type.text == type_select }
      end

      def buscar_questions(text_search)
        input_query_browse.set text_search
      end

      def clicar_buscar
        btn_search.click
      end

      def contador_resultados
        table_linhas.count
      end
    end
  end
end
