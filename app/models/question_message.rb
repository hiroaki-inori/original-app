class QuestionMessage
  include ActiveModel::Model
  # セッター、ゲッター
  attr_accessor :title, :category_id, :outline, :who_id, :sentence, :user_id, :content

  # バリデーション(question)
  with_options presence: true do
    validates :title
    validates :category_id
    validates :outline
    # validates :content
  end

  # バリデーション(msessage)
  with_options presence: true do
    validates :who_id
    validates :sentence
  end

  # データベース保存
  def save
    question = Question.create(title: title, category_id: category_id, outline: outline, content: content, user_id: user_id)
    Message.create(who_id: who_id, sentence: sentence, question_id: question.id)
  end
end