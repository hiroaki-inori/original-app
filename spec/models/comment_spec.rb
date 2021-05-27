require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できるとき' do
      it 'ちゃんと入力すれば登録できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿できないとき' do
      it 'textが空では登録できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end
      it 'user_idが紐づいていない商品は登録できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'question_idが紐づいていない商品は登録できない' do
        @comment.question = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Questionを入力してください')
      end
    end
  end
end
