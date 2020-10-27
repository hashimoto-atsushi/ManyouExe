require 'rails_helper'

RSpec.describe 'ユーザーの登録テスト', type: :system do
  # before do
  #   FactoryBot.create(:task)
  #   FactoryBot.create(:second_task)
  #   FactoryBot.create(:third_task)
  # end

  describe '新規ユーザー登録機能' do
    context 'ユーザーを新規登録した場合' do
      it 'マイページに名前が表示される' do
        visit new_user_path
        fill_in 'user_name', with: '山田太郎'
        fill_in 'user_email',with: 'yamada@example.com'
        fill_in 'user_password', with: 'yamadayamada'
        fill_in 'user_password_confirmation', with: 'yamadayamada'
        click_on '登録する'
        expect(page).to have_content '山田太郎'
      end
    end
  end

  describe 'ログインせずにタスク一覧へ移動した時の挙動' do
    context 'ログインせずにタスク一覧へ移動した場合' do
      it 'ログイン画面へ誘導される' do
        visit new_user_path
        visit tasks_path
        expect(page).to have_content 'ログイン'
        expect(page).to have_content 'Eメール' 
        expect(page).to have_content 'パスワード'
      end
    end
  end
end
