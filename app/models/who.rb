class Who < ActiveHash::Base
  self.data = [
    { id: 1, name: '自分' },
    { id: 2, name: '相手' },
  ]

  include ActiveHash::Associations
  has_many :messages
end