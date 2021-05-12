class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '仕事' },
    { id: 3, name: '友人' },
    { id: 4, name: '恋愛' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :questions
end