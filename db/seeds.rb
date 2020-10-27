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
