require 'rails_helper'

RSpec.describe 'ラベル機能', type: :system do
  before do
    FactoryBot.create(:user)
    login_In
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task_task_name', with: 'TASK1'
        fill_in 'task_task_detail',with: 'TASK1_DETAIL'
        fill_in 'task_due', with: '2020-01-01'.to_date
        select '完了', from: "task[status]"
        select '高', from: "task[priority]"
        check "task_sticker_ids_1", visible: false
      end
    end
  end
end




  private
  def login_In
    visit new_session_path
    fill_in 'session_email', with: 'yamada@example.com'
    fill_in 'session_password', with: 'yamadayamada'
    click_on 'ログインする'
    visit new_task_path
  end
