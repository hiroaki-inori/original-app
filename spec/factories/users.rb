FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a123456'}
    password_confirmation {password}
    age_id  { 2 }
    gender_id { 2 }
    occupation_id {2}
    pr  {'よろしくお願いします'}

    after(:build) do |user|
      user.prof_image.attach(io: File.open('public/images/test.png'), filename: 'test.png', content_type: 'image/png')
    end
  end
end