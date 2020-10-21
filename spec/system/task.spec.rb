require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task_task_name', with: 'TASK1'
        fill_in 'task_task_detail',with: 'TASK1_DETAIL'
        fill_in 'task_due', with: '2020-01-01'.to_date
        click_on '登録する'
        expect(page).to have_content '1'
        expect(page).to have_content '2020年01月01日'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, task_name: 'task2', task_detail: "task_detail2")
        visit tasks_path
        expect(page).to have_content 'task2'
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
        expect(task_last).to have_content "2"
        save_and_open_page
      end
    end
    context 'タスクが終了期限の降順で記載する' do
      it '終了期限の遅いものがタスクが一番上に表示される'do
        task = FactoryBot.create(:task)
        task = FactoryBot.create(:second_task)
        task = FactoryBot.create(:third_task)
        visit tasks_path
        task = all('#task_list')
        task_last = task[0]
        expect(task_last).to have_content "2"
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
end
