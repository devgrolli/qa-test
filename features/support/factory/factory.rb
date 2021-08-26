require 'faker'
require 'documentos_br'

class Factory
  def self.cadastro
    {
      name: Faker::Name.first_name,
      password: Faker::Internet.password(min_length: 8),
      email: Faker::Internet.email
    }
  end

  def self.comics_questions
    {
      category: 'Entertainment: Comics',
      type: 'Multiple Choice',
      dificulty: 'Easy',
      question: 'Quem matou metade do universo na Marvel?',
      corret: Faker::Superhero.name,
      incorrect: Faker::Superhero.prefix,
      reference: 'https://www.legiaodosherois.com.br/2019/vingadores-marvel-confirma-que-thanos-matou-metade-da-vida-vegetal-no-universo.html'
    }
  end

  def self.cars_questions
    {
      category: 'Vehicles',
      type: 'Multiple Choice',
      dificulty: 'Easy',
      question: 'Qual o carro dirige sozinho?',
      corret: Faker::Vehicle.make_and_model,
      incorrect: Faker::Vehicle.manufacture,
      reference: 'https://www.tesla.com/'
    }
  end
end
