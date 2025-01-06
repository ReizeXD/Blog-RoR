FactoryBot.define do
    factory :post do
      title { "Titulo" }
      content { "Conteúdo" }
      association :user
    end
  end
  