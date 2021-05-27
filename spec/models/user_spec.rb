require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全て入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録/ユーザー情報が登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに@が存在しない場合登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordに全角が入っている場合は登録できない' do
        @user.password = 'a１2345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが半角英語のみの場合は登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordとpassword_confirmationが一致しない場合は登録できない' do
        @user.password_confirmation = "#{@user.password}aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
    context '新規登録/本人情報確認ができないとき' do
      it 'ユーザーの年齢が正しく選択されていないと登録できない' do
        @user.age_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('年齢を選択してください')
      end
      it 'ユーザーの性別が正しく選択されていないと登録できない' do
        @user.gender_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選択してください')
      end
      it 'ユーザーの職業が正しく選択されていないと登録できない' do
        @user.occupation_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('職業を選択してください')
      end
      it '自己紹介が空では場合は登録できない' do
        @user.pr = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('自己紹介を入力してください')
      end
    end
  end
end
