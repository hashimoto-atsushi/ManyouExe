require 'rails_helper'

RSpec.describe 'ラベル機能', type: :system do
  before do
    FactoryBot.create(:making_label)
    FactoryBot.create(:second_making_label)
    FactoryBot.create(:third_making_label)
    FactoryBot.create(:user)
    login_In
    fill_In
  end

  describe '新規タスクでのラベル作成機能' do
    context 'タスクを新規作成時、ラベルを含め登録した場合' do
      it 'タスク一覧詳細画面に登録したタスクが表示される' do
        visit new_task_path
        fill_in 'task_task_name', with: 'TASK1'
        fill_in 'task_task_detail',with: 'TASK1_DETAIL'
        fill_in 'task_due', with: '2020-01-01'.to_date
        select '完了', from: "task[status]"
        select '高', from: "task[priority]"
        check 'task_sticker_ids_0'
        click_on '登録する'
        expect(find('ul').all('li')[0]).to have_content 'lable_X1'
      end
    end
  end

  describe '新規タスクでのラベル作成機能' do
    context 'タスクを新規作成時、複数のラベルを含め登録した場合' do
      it 'タスク一覧詳細画面に登録した複数のラベルが表示される' do
        visit new_task_path
        fill_in 'task_task_name', with: 'TASK1'
        fill_in 'task_task_detail',with: 'TASK1_DETAIL'
        fill_in 'task_due', with: '2020-01-01'.to_date
        select '完了', from: "task[status]"
        select '高', from: "task[priority]"
        check 'task_sticker_ids_0'
        check 'task_sticker_ids_2'
        click_on '登録する'
        expect(find('ul').all('li')[0]).to have_content 'lable_X1'
        expect(find('ul').all('li')[1]).to have_content 'lable_Z3'
        expect(page).not_to have_content 'lable_Y2'
      end
    end
  end

  describe '新規タスクでのラベル作成機能' do
    context 'ラベルの編集した場合' do
      it 'タスク一覧詳細画面に編集後のラベルが表示される' do
        visit new_task_path
        fill_in 'task_task_name', with: 'TASK1'
        fill_in 'task_task_detail',with: 'TASK1_DETAIL'
        fill_in 'task_due', with: '2020-01-01'.to_date
        select '完了', from: "task[status]"
        select '高', from: "task[priority]"
        check 'task_sticker_ids_0'
        click_on '登録する'
        expect(find('ul').all('li')[0]).to have_content 'lable_X1'
        visit tasks_path
        task = all('tbody tr')[0].click_link '編集'
        page.driver.browser.switch_to.alert.text.should == '編集してもいいですか？'
        page.driver.browser.switch_to.alert.accept
        check 'task_sticker_ids_1'
        click_on '更新する'
        expect(find('ul').all('li')[0]).to have_content 'lable_Y2'
        expect(page).not_to have_content 'lable_X1'
      end
    end
  end

  describe 'ラベルでの検索機能' do
    context 'ラベル名のみで検索した場合' do
      it 'ラベル名で検索した結果が正しく表示される' do
        visit tasks_path
        select 'lable_X1', from: "sticker_id"
        click_on 'search'
        tds = all('tbody tr')[0].all('td')
        expect(tds[7]).to have_content 'lable_X1'
        expect(tds[7]).to have_content 'lable_Y2'
        expect(tds[7]).not_to have_content 'lable_Z3'
        select 'lable_Z3', from: "sticker_id"
        click_on 'search'
        tds = all('tbody tr')[0].all('td')
        expect(tds[7]).to have_content 'lable_Z3'
        expect(tds[7]).not_to have_content 'lable_X1'
        expect(tds[7]).not_to have_content 'lable_Y2'
      end
    end
  end

  describe 'ラベルでの検索機能' do
    context 'タスク名、着手状況、ラベル名で検索した場合' do
      it '上記３項目での検索した結果が正しく表示される' do
        visit tasks_path
        fill_in 'task_name', with: 'TASK1'
        select '未着手', from: "status"
        select 'lable_X1', from: "sticker_id"
        click_on 'search'
        tds = all('tbody tr')[0].all('td')
        expect(tds[1]).to have_content 'TASK1'
        expect(tds[5]).to have_content '未着手'
        expect(tds[7]).to have_content 'lable_X1'
      end
    end
  end

  describe 'ラベルでの検索機能' do
    context 'タスク名、着手状況、ラベル名で検索した場合' do
      it '上記３項目での検索した結果が正しく表示される' do
        visit tasks_path
        fill_in 'task_name', with: 'TASK2'
        select '着手中', from: "status"
        select 'lable_Y2', from: "sticker_id"
        click_on 'search'
        tds = all('tbody tr')[0].all('td')
        expect(tds[1]).to have_content 'TASK2'
        expect(tds[5]).to have_content '着手中'
        expect(tds[7]).to have_content 'lable_Y2'
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


  def fill_In
    fill_in 'task_task_name', with: 'TASK1'
    fill_in 'task_task_detail',with: 'DETAIL1'
    fill_in 'task_due', with: '2020-01-01'.to_date
    select '未着手', from: "task[status]"
    select '中', from: "task[priority]"
    check 'task_sticker_ids_0'
    click_on '登録する'
    visit new_task_path
    fill_in 'task_task_name', with: 'TASK2'
    fill_in 'task_task_detail',with: 'DETAIL2'
    fill_in 'task_due', with: '2020-01-20'.to_date
    select '着手中', from: "task[status]"
    select '高', from: "task[priority]"
    check 'task_sticker_ids_0'
    check 'task_sticker_ids_1'
    click_on '登録する'
    visit new_task_path
    fill_in 'task_task_name', with: 'TASK3'
    fill_in 'task_task_detail',with: 'DETAIL3'
    fill_in 'task_due', with: '2020-01-10'.to_date
    select '完了', from: "task[status]"
    select '低', from: "task[priority]"
    check 'task_sticker_ids_2'
    click_on '登録する'
  end
