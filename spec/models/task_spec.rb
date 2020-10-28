require 'rails_helper'

RSpec.describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        FactoryBot.create(:thousand_user)
        task = Task.new(task_name: '', task_detail: 'TEST_DETAIL', due: '2020-01-01', user_id:"1000")
        expect(task).not_to be_valid
      end
    end
  end
  describe 'バリデーションのテスト' do
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        FactoryBot.create(:thousand_user)
        task = Task.new(task_name: 'TEST_NAME', task_detail: '', due: '2020-01-01', user_id:"1000")
        expect(task).not_to be_valid
      end
    end
  end
    describe 'バリデーションのテスト' do
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        FactoryBot.create(:thousand_user)
        task = Task.new(task_name: 'TEST_NAME', task_detail: 'TEST_DETAIL', due: '2020-01-01', user_id:"1000")
        expect(task).to be_valid
      end
    end
  end
  describe '検索機能' do
    let!(:user) {FactoryBot.create(:thousand_user)}
    let!(:task) {FactoryBot.create(:task, task_name: 'task', due: "2020-01-01".to_date, status: "未着手", user_id: '1000')}
    let!(:second_task) {FactoryBot.create(:second_task, task_name: "sample", due: "2020-02-02".to_date, status: "完了", user_id: '1000')}
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.search_by_task_name('task')).to include(task)
        expect(Task.search_by_task_name('task')).not_to include(second_task)
        expect(Task.search_by_task_name('task').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.search_by_status('未着手')).to include(task)
        expect(Task.search_by_status('未着手')).not_to include(second_task)
        expect(Task.search_by_status('未着手').count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        expect(Task.search_by_task_name('task')).to include(task)
        expect(Task.search_by_status('未着手')).to include(task)
        expect(Task.search_by_task_name('task').count).to eq 1
        expect(Task.search_by_status('未着手').count).to eq 1
      end
    end
  end
end
