require 'rails_helper'

RSpec.describe 'セッション機能テスト', type: :system do
  before do
    FactoryBot.create(:user)
  #   FactoryBot.create(:third_task)
  end

  describe 'セッション機能のテスト' do
    context 'ログインした場合' do
      it 'ログイン後、タスク一覧画面へ移動する' do
        visit new_session_path
        fill_in 'session_email', with: 'yamada@exmaple.com'
        fill_in 'session_password', with: 'yamadayamada'
        click_on 'ログインする'
        expect(page).to have_content 'タスク一覧'
        expect(page).to have_content '着手状況'
      end
    end
  end
end
