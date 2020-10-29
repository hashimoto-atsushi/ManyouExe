require 'rails_helper'

RSpec.describe 'セッション機能テスト', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
    FactoryBot.create(:thousand_user)
  end

  describe 'セッション機能のテスト' do
    context 'ログインした場合' do
      it 'ログイン後、タスク一覧画面へ移動する' do
        visit new_session_path
        fill_in 'session_email', with: 'yamada@example.com'
        fill_in 'session_password', with: 'yamadayamada'
        click_on 'ログインする'
        expect(page).to have_content 'タスク一覧'
        expect(page).to have_content '着手状況'
      end
    end
  end
  describe 'セッション機能のテスト' do
    context 'ログインした後' do
      it '自分の詳細画面(マイ・ページ)に飛べること' do
        visit new_session_path
        fill_in 'session_email', with: 'yamada@example.com'
        fill_in 'session_password', with: 'yamadayamada'
        click_on 'ログインする'
        click_link 'マイ・ページ'
        expect(page).to have_content 'ユーザー情報詳細'
        expect(page).to have_content '山田太郎'
        expect(page).to have_content 'yamada@example.com'
      end
    end
  end
  describe 'セッション機能のテスト' do
    context '一般ユーザー（ログイン中）が他人のマイページに飛んだ時' do
      it 'タスク一覧に飛ぶ' do
        visit new_session_path
        fill_in 'session_email', with: 'yamada@example.com'
        fill_in 'session_password', with: 'yamadayamada'
        click_on 'ログインする'
        visit user_path(1000)
        expect(page).to have_content 'タスク一覧'

      end
    end
  end
  describe 'セッション機能のテスト' do
    context 'ログインした場合' do
      it 'ログイン後、タスク一覧画面へ移動する' do
        visit new_session_path
        fill_in 'session_email', with: 'yamada@example.com'
        fill_in 'session_password', with: 'yamadayamada'
        click_on 'ログインする'
        expect(page).to have_content 'タスク一覧'
        expect(page).to have_content '着手状況'
        click_on 'ログアウト'
        expect(page).to have_content 'ログイン'
        expect(page).to have_content 'パスワード'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end
end
