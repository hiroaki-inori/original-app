FactoryBot.define do
  factory :comment do
    text  {'よろしくお願いします'}
    association :user
    association :question
  end
end