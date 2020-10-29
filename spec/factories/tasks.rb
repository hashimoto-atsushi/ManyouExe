FactoryBot.define do
  factory :task do
    task_name { 'TASK1' }
    task_detail { 'DETAIL1' }
    due { '2020-01-10'.to_date }
    status { '未着手' }
    priority { '中' }
  end
  factory :second_task, class: Task do
    task_name { 'TASK2' }
    task_detail { 'DETAIL2' }
    due { '2020-01-20'.to_date }
    status { '未着中' }
    priority { '高' }
  end
  factory :third_task, class: Task do
    task_name { 'TASK3' }
    task_detail { 'DETAIL3' }
    due { '2020-01-01'.to_date }
    status { '完了' }
    priority { '低' }
  end
end

  def login_task
    visit new_session_path
    fill_in 'session_email', with: 'yamada@example.com'
    fill_in 'session_password', with: 'yamadayamada'
    click_on 'ログインする'
    visit new_task_path
    fill_in 'task_task_name', with: 'TASK1'
    fill_in 'task_task_detail',with: 'TASK1_DETAIL'
    fill_in 'task_due', with: '2020-01-01'.to_date
    select '未着手', from: "task[status]"
    select '中', from: "task[priority]"
    click_on '登録する'
    visit new_task_path
    fill_in 'task_task_name', with: 'TASK2'
    fill_in 'task_task_detail',with: 'TASK1_DETAIL2'
    fill_in 'task_due', with: '2020-01-10'.to_date
    select '着手中', from: "task[status]"
    select '高', from: "task[priority]"
    click_on '登録する'
    visit new_task_path
    fill_in 'task_task_name', with: 'TASK3'
    fill_in 'task_task_detail',with: 'TASK1_DETAIL3'
    fill_in 'task_due', with: '2020-01-10'.to_date
    select '完了', from: "task[status]"
    select '低', from: "task[priority]"
    click_on '登録する'
    end
