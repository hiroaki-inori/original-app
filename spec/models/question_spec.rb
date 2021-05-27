require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    message = FactoryBot.build(:message)
    @question = FactoryBot.build(:question)
    message.who_id = 1
    message.sentence = "こんにちは"
    sleep 0.1
  end

  describe '相談投稿機能' do
    context '新規投稿できるとき' do
      it '全て入力すれば登録できる' do
        expect(@question).to be_valid
      end
    end
    context '相談投稿が登録できないとき' do
      it '相談タイトルが空では登録できない' do
        @question.title = ''
        @question.valid?
        expect(@question.errors.full_messages).to include('相談タイトルを入力してください')
      end
      it '相談タイトルが35文字以上では登録できない' do
        @question.title = 'ああああああああああああああああああああああああああああああああああああ'
        @question.valid?
        expect(@question.errors.full_messages).to include('相談タイトルは35文字以内で入力してください')
      end
      it '相談したいジャンルが空では登録できない' do
        @question.category_id = 1
        @question.valid?
        expect(@question.errors.full_messages).to include('相談したいジャンルを選択してください')
      end
      it '相談概要が空では登録できない' do
        @question.outline = ''
        @question.valid?
        expect(@question.errors.full_messages).to include('相談概要を入力してください')
      end
      # it '現在進行中の文面が空では登録できない' do
      #   message.sentence = ''
      #   @question.valid?
      #   expect(@question.errors.full_messages).to include('現在進行中の文面を入力してください')
      # end
    end
  end
end
