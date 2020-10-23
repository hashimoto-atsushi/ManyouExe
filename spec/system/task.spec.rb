require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

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
        expect(page).to have_content 'DETAIL'
        expect(page).to have_content '2020年01月01日'
        expect(page).to have_content '完了'
        expect(page).to have_content '高'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task)
        visit tasks_path
        expect(page).to have_content 'TASK1'
        expect(page).to have_content 'DETAIL1'
        expect(page).to have_content '2020年01月10日'
        expect(page).to have_content '未着手'
      end
    end
    context 'タスクが作成日時の降順で記載する' do
      it '新しいタスクが一番上に表示される'do
        task = FactoryBot.create(:task)
        task = FactoryBot.create(:second_task)
        task = FactoryBot.create(:third_task)
        visit tasks_path
        task = all('#task_list')
        task_last = task[0]
        expect(task_last).to have_content 'TASK3'
      end
    end
    context 'タスクが終了期限の降順で記載する' do
      it '終了期限でソートし、の遅いものがタスクが一番上に表示される'do
        task = FactoryBot.create(:task)
        task = FactoryBot.create(:second_task)
        task = FactoryBot.create(:third_task)
        visit tasks_path
        click_link "期限降順"
        task = all('#task_list')
        task_last = task[0]
        expect(task_last).to have_content "2020年01月20日"
      end
    end
    context 'タスクが優先順位の降順で記載する' do
      it '優先順位の高いものがタスクが一番上に表示される'do
        task = FactoryBot.create(:task)
        task = FactoryBot.create(:second_task)
        task = FactoryBot.create(:third_task)
        visit tasks_path
        click_link "優先順位降順"
        task = all('#task_list')
        task_last = task[0]
        expect(task_last).to have_content "高"
        save_and_open_page
      end
    end








  end

  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         task = FactoryBot.create(:task, id:'5', task_name: 'task_Nini', task_detail: 'detail_Nini')
         visit tasks_path
         visit task_path(5)
         expect(page).to have_content 'Nini'
       end
     end
  end

  describe '検索機能' do
    context 'タスク名のみで検索した場合' do
      it 'タスク名で検索した結果が正しく表示される' do
        task = FactoryBot.create(:task, task_name: 'zxcvasdf', task_detail: 'タスク詳細1', due: '2020-01-01'.to_date, status: '未着手')
        task = FactoryBot.create(:task, task_name: '12345678', task_detail: 'タスク詳細3', due: '2020-01-01'.to_date, status: '着手中')
        task = FactoryBot.create(:task, task_name: '&&&&&&&&', task_detail: 'タスク詳細3', due: '2020-01-01'.to_date, status: '完了')
        visit tasks_path
        fill_in 'task_name', with: 'zxcvasdf'
        click_on 'search'
        expect(page).to have_content 'zxcvasdf'
        expect(page).not_to have_content '12345678'
        expect(page).not_to have_content '&&&&&&&&'
      end
    end
  end

  describe '検索機能' do
    context 'ステータスのみで検索した場合' do
      it 'ステータスで検索した結果が正しく表示される' do
        task = FactoryBot.create(:task, task_name: 'zxcvasdf', task_detail: 'タスク詳細1', due: '2020-01-01'.to_date, status: '未着手DAMMY')
        task = FactoryBot.create(:task, task_name: '12345678', task_detail: 'タスク詳細3', due: '2020-01-01'.to_date, status: '着手中DAMMY')
        task = FactoryBot.create(:task, task_name: '&&&&&&&&', task_detail: 'タスク詳細3', due: '2020-01-01'.to_date, status: '完了')
        visit tasks_path
        select '完了', from: "status"
        click_on 'search'
        expect(page).to have_content '完了'
        expect(page).not_to have_content '未着手DAMMY'
        expect(page).not_to have_content '着手中DAMMY'
      end
    end
  end

  describe '検索機能' do
    context 'タスク名とステータスのAND条件で検索した場合' do
      it 'タスク名とステータスのAND条件で検索した結果が正しく表示される' do
        task = FactoryBot.create(:task, task_name: 'zxcvasdf', task_detail: 'タスク詳細1', due: '2020-01-01'.to_date, status: '未着手DAMMY')
        task = FactoryBot.create(:task, task_name: '12345678', task_detail: 'タスク詳細3', due: '2020-01-01'.to_date, status: '着手中DAMMY')
        task = FactoryBot.create(:task, task_name: '&&&&&&&&', task_detail: 'タスク詳細3', due: '2020-01-01'.to_date, status: '完了')
        visit tasks_path
        fill_in 'task_name', with: '&&&&&&&&'
        select '完了', from: "status"
        click_on 'search'
        expect(page).to have_content '完了'
        expect(page).to have_content '&&&&&&&&'
      end
    end
  end
end
