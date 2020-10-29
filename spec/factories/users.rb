FactoryBot.define do
  factory :admin_user, class: User do
    name { "admin" }
    email { "admin@example.com" }
    password { "adminadmin" }
    admin { "true" }
  end
  factory :user do
    name { "山田太郎" }
    email { "yamada@example.com" }
    password { "yamadayamada" }
    admin { "false" }
  end
  factory :second_user, class: User do
    name { "佐藤一郎" }
    email { "sato@example.com" }
    password { "satosato" }
    admin { "false" }
  end
  factory :thousand_user, class: User do
    id { "1000" }
    name { "1000君" }
    email { "thousand@example.com" }
    password { "10001000" }
    admin { "false" }
  end
end
