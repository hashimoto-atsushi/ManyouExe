FactoryBot.define do
  factory :admin_user, class: User do
    id { "1" }
    name { "admin" }
    email { "admin@example.com" }
    password { "adminadmin" }
    admin { "true" }
  end
  factory :user do
    id { "2" }
    name { "山田太郎" }
    email { "yamada@example.com" }
    password { "yamadayamada" }
    admin { "false" }
  end
  factory :second_user, class: User do
    id { "3" }
    name { "佐藤一郎" }
    email { "sato@example.com" }
    password { "satosato" }
    admin { "false" }
  end
end
