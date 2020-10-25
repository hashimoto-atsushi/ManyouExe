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
