FactoryBot.define do
  factory :making_label, class: Sticker do
    id {"0"}
    sticker_name { 'lable_X1' }
  end
  factory :second_making_label, class: Sticker do
    id {"1"}
    sticker_name { 'lable_Y2' }
  end
  factory :third_making_label, class: Sticker do
    id {"2"}
    sticker_name { 'lable_Z3' }
  end
end
