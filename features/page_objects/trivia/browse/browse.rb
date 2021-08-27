module PageTrivia
  module Browse
    class Browse < SitePrism::Page
      set_url '/'

      element :paginate, '.pagination'
      element :alert_error, '.alert-danger'
      element :btn_browse, '[class*="btn"] [class="fa fa-bars"]'
      element :btn_login, 'fa fa-sign-in'
      element :input_query_browse, '#query'
      element :btn_search, '[role="button"]'
      elements :select_type, '#type option'
      elements :table_linhas, 'table tbody tr'
      element :btn_cadastrar_question, '.btn-primary'
      element :input_question, '#trivia_question'
      element :input_awnser, '#correct_answer'
      element :input_incorret, '#incorrect_answer_1'
      element :input_reference, '#trivia_reference'
      elements :select_categorias, '#trivia_category option'
      elements :select_type, '#trivia_type option'
      elements :select_difficulty, '#trivia_difficulty option'

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

      def cadastrar_new_question(question)
        select_categorias.select { |categorias| categorias.click if categorias.text == question[:category] }
        select_type.select { |type| type.click if type.text == question[:type] }
        select_difficulty.select { |dificuldade| dificuldade.click if dificuldade.text == question[:dificulty] }
        input_question.set question[:question]
        input_awnser.set question[:corret]
        input_incorret.set question[:incorrect]
        input_reference.set question[:reference]
        btn_cadastrar_question.click
      end
    end
  end
end
