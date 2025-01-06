FactoryBot.define do
    factory :comment do
      content { "Conteúdo" }
      anon { false}
      association :user
      association :post
    end
  end
  