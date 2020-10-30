1.times do |n|
  name = "admin"
  email = "admin@example.com"
  password = "adminadmin"
  admin = "true"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: admin,
              )
end


sticker_name = "打合せ"
Sticker.create!(sticker_name: sticker_name)
sticker_name = "社外秘"
Sticker.create!(sticker_name: sticker_name)
sticker_name = "共有"
Sticker.create!(sticker_name: sticker_name)
sticker_name = "告知"
Sticker.create!(sticker_name: sticker_name)
sticker_name = "重要"
Sticker.create!(sticker_name: sticker_name)
