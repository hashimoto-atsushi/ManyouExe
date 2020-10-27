FactoryBot.define do
  factory :admin_user, class: User do
    name { "admin" }
    email { "admin@exmaple.com" }
    password { "adminadmin" }
    admin { "true" }
  end
  factory :user do
    name { "山田太郎" }
    email { "yamada@exmaple.com" }
    password { "yamadayamada" }
    admin { "false" }
  end
end
