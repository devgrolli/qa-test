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
end
