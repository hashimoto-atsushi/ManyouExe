require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:user)
    login_task
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
        click_on '登録する'
        expect(page).to have_content '1'
        expect(page).to have_content 'TASK1_DETAIL'
        expect(page).to have_content '2020年01月01日'
        expect(page).to have_content '完了'
        expect(page).to have_content '高'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # visit new_task_path
        # fill_in 'task_task_name', with: 'TASK1'
        # fill_in 'task_task_detail',with: 'DETAIL1'
        # fill_in 'task_due', with: '2020-01-10'.to_date
        # select '完了', from: "task[status]"
        # select '高', from: "task[priority]"
        # click_on '登録する'
        visit tasks_path
        expect(page).to have_content 'TASK1'
        expect(page).to have_content 'DETAIL1'
        expect(page).to have_content '2020年01月10日'
        expect(page).to have_content '未着手'
      end
    end
  end

  describe '一覧表示機能' do
    context 'タスクが作成日時の降順で記載する' do
      it '新しいタスクが一番上に表示される'do
        visit tasks_path
        task = all('tbody tr')
        task_top = task[0]
        task_bottom = task[2]
        expect(task_top).to have_content 'TASK3'
        expect(task_bottom).to have_content 'TASK1'
      end
    end
  end
#
  describe '一覧表示機能' do
    context 'タスクが終了期限の降順で記載する' do
      it '終了期限でソートし、の遅いものがタスクが一番上に表示される'do
        visit tasks_path
        click_link "期限降順"
        task = all('tbody tr')
        task_top = task[0]
        task_middle = task[1]
        task_bottom = task[2]
        expect(task_top).to have_content "2020年01月20日"
        expect(task_middle).to have_content "2020年01月10日"
        expect(task_bottom).to have_content "2020年01月01日"
      end
    end
  end
#
  describe '一覧表示機能' do
    context 'タスクが優先順位の降順で記載する' do
      it '優先順位の高いものがタスクが一番上に表示される'do
        visit tasks_path
        click_link "優先順位降順"
        task = all('tbody tr')
        task_top = task[0]
        task_bottom = task[2]
        expect(task_top).to have_content '高'
        expect(task_bottom).to have_content '低'
      end
    end
  end
#
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         visit tasks_path
         visit new_task_path
         fill_in 'task_task_name', with: 'XYZ'
         fill_in 'task_task_detail',with: 'DETAIL_XYZ'
         fill_in 'task_due', with: '2020-01-30'.to_date
         select '着手中', from: "task[status]"
         select '高', from: "task[priority]"
         click_on '登録する'
         visit tasks_path
         task = all('tbody tr')[0].click_link '詳細'
         expect(page).to have_content 'XYZ'
       end
     end
  end
end

RSpec.describe '検索機能をテスト', type: :system do
  before do
    FactoryBot.create(:user)
    login_task
  end

  describe '検索機能' do
    context 'タスク名のみで検索した場合' do
      it 'タスク名で検索した結果が正しく表示される' do
        visit tasks_path
        fill_in 'task_name', with: 'SK1'
        click_on 'search'
        expect(page).to have_content 'TASK1'
      end
    end
  end

  describe '検索機能' do
    context 'ステータスのみで検索した場合' do
      it 'ステータスで検索した結果が正しく表示される' do
        visit tasks_path
        select '完了', from: "status"
        click_on 'search'
        expect(page).to have_content '完了'
      end
    end
  end
#
  describe '検索機能' do
    context 'タスク名とステータスのAND条件で検索した場合' do
      it 'タスク名とステータスのAND条件で検索した結果が正しく表示される' do
        visit tasks_path
        fill_in 'task_name', with: 'SK3'
        select '完了', from: "status"
        click_on 'search'
        expect(page).to have_content '完了'
        expect(page).to have_content 'TASK3'
      end
    end
  end
end

private
def login_task
  visit new_session_path
  fill_in 'session_email', with: 'yamada@example.com'
  fill_in 'session_password', with: 'yamadayamada'
  click_on 'ログインする'
  visit new_task_path
  fill_in 'task_task_name', with: 'TASK1'
  fill_in 'task_task_detail',with: 'DETAIL1'
  fill_in 'task_due', with: '2020-01-01'.to_date
  select '未着手', from: "task[status]"
  select '中', from: "task[priority]"
  click_on '登録する'
  visit new_task_path
  fill_in 'task_task_name', with: 'TASK2'
  fill_in 'task_task_detail',with: 'DETAIL2'
  fill_in 'task_due', with: '2020-01-20'.to_date
  select '着手中', from: "task[status]"
  select '高', from: "task[priority]"
  click_on '登録する'
  visit new_task_path
  fill_in 'task_task_name', with: 'TASK3'
  fill_in 'task_task_detail',with: 'DETAIL3'
  fill_in 'task_due', with: '2020-01-10'.to_date
  select '完了', from: "task[status]"
  select '低', from: "task[priority]"
  click_on '登録する'
end
