FactoryBot.define do
  factory :task do
    task_name { 'TASK1' }
    task_detail{ 'DETAIL1' }
  end
  factory :second_task, class: Task do
    task_name { 'TASK2' }
    task_detail{ 'DETAIL3' }
  end
  factory :third_task, class: Task do
    task_name { 'TASK3' }
    task_detail{ 'DETAIL3' }
  end
end
