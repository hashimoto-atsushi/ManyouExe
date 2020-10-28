require 'rails_helper'

RSpec.describe '管理者の登録テスト', type: :system do
  before do
    FactoryBot.create(:admin_user)
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
  end

  describe '管理者に関する動作確認' do
    context '管理者でログインした場合' do
      it '管理画面にアクセスできる' do
        visit new_session_path
        fill_in 'session_email',with: 'admin@example.com'
        fill_in 'session_password', with: 'adminadmin'
        click_on 'ログインする'
        expect(page).to have_content 'タスク一覧'
        click_link 'ユーザー管理画面へ'
        expect(page).to have_content 'ユーザー管理画面'
      end
    end
  end

  describe '管理者に関する動作確認' do
    context '一般ユーザーでログインした場合' do
      it '管理画面にアクセスできない' do
        visit new_session_path
        fill_in 'session_email',with: 'yamada@example.com'
        fill_in 'session_password', with: 'yamadayamada'
        click_on 'ログインする'
        expect(page).to have_content 'タスク一覧'
        expect(page).not_to have_content 'ユーザー管理画面'
        visit admin_users_path
        expect(page).to have_content 'タスク一覧'
      end
    end
  end
  describe '管理者に関する動作確認' do
    context '管理者でログインした場合' do
      it '新規ユーザー登録ができる' do
        visit new_session_path
        fill_in 'session_email',with: 'admin@example.com'
        fill_in 'session_password', with: 'adminadmin'
        click_on 'ログインする'
        expect(page).to have_content 'タスク一覧'
        click_link 'ユーザー管理画面へ'
        expect(page).to have_content 'ユーザー管理画面'
        click_link '新規ユーザー登録へ'
        expect(page).to have_content '新規ユーザー登録'
        fill_in 'user_name', with: '加藤二郎'
        fill_in 'user_email',with: 'kato@example.com'
        fill_in 'user_password', with: 'katokato'
        fill_in 'user_password_confirmation', with: 'katokato'
        click_on '登録する'
        expect(page).to have_content '加藤二郎'
      end
    end
  end
  describe '管理者に関する動作確認' do
    context '管理者でログインした場合' do
      it 'ユーザー詳細画面にアクセスができる' do
        visit new_session_path
        fill_in 'session_email',with: 'admin@example.com'
        fill_in 'session_password', with: 'adminadmin'
        click_on 'ログインする'
        expect(page).to have_content 'タスク一覧'
        click_link 'ユーザー管理画面へ'
        expect(page).to have_content 'ユーザー管理画面'
        task = all('tbody tr')[1].click_link '詳細'
        expect(page).to have_content 'ユーザー情報詳細'
        expect(page).to have_content '山田太郎'
      end
    end
  end
  describe '管理者に関する動作確認' do
    context '管理者でログインした場合' do
      it '編集画面からユーザー編集ができる' do
        visit new_session_path
        fill_in 'session_email',with: 'admin@example.com'
        fill_in 'session_password', with: 'adminadmin'
        click_on 'ログインする'
        expect(page).to have_content 'タスク一覧'
        click_link 'ユーザー管理画面へ'
        expect(page).to have_content 'ユーザー管理画面'
        task = all('tbody tr')[1].click_link '編集'
        page.driver.browser.switch_to.alert.text.should == '編集してもいいですか？'
        page.driver.browser.switch_to.alert.accept
        binding.irb
        fill_in 'user_name', with: '山田太郎2'
        fill_in 'user_email',with: 'yamada2@example.com'
        fill_in 'user_password', with: 'yamadayamada'
        fill_in 'user_password_confirmation', with: 'yamadayamada'
        click_on '更新する'
        expect(page).to have_content '山田太郎2'
        expect(page).to have_content 'yamada2@example.com'
      end
    end
  end
end
