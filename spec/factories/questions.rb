FactoryBot.define do
  factory :question do
    title              {'こんにちは'}
    outline            {'私を助けてください'}
    category_id { 2 }
    association :user
  end
end