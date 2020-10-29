# README
#テーブルのスキーマ

##tasksテーブル
  - t.strig :"task_name" **実装済**
  - t.text :"task_detail" **実装済**
  - t.date :"due"
  - t.string :"status"
  - t.string :"priority"
  - t.string :"charge"
  - t.bigint :"user_id"
  - t.datetime :"created_at" **実装済**
  - t.datetime :"datetime"  **実装済**
  - t.index ["user_id"], name: "index_tasks_on_user_id"

##usersテーブル
  - t.string :"name"
  - t.string :"email"
  - t.string :"password_digest"
  - t.datetime :created_at"
  - t.datetime :"datetime"
  - t.booleam :"admin"
  - t.index["email"], name: "index_users_on_email", unique: true

##stickers_tasks (多対多用)
  - t.integer :"sticker_id"
  - t.integer :"task_id"
  - t.datetime :"created_at"
  - t.datetime :"datetime"

##stickers
  - t.string :"sticker_name"
  - t.datetime :"created_at"
  - t.datetime :"datetime"


# Herokuデプロイまでの手順

## Heoku登録、ログイン
  1. Herokuにアカウント登録をする
  1. Herokuをinstall
   - $ brew tap heroku/brew && brew install heroku
  1. Herokuへログイン
  1. heroku: Press any key to open up the browser to login or q to exit: で、OKの場合はEnter
  1. Webブラウザーでログイン作業を行う

## Herokuへデプロイ
  1. $ rails assets:precompile RAILS_ENV=production  
  1. ~/workspace/heroku_test_app (master) $ git add -A
  1. ~/workspace/heroku_test_app (master) $ git commit -m "init"
  1. $ heroku create
  1. $ heroku buildpacks:set heroku/ruby
  1. $ heroku buildpacks:add --index 1 heroku/nodejs
  1. $ git push heroku master
  1. $ heroku run rails db:migrate
  1. https://アプリ名.herokuapp.com/  
     上記URL「アプリ名」に、都度作成したアプリ名を適応させてアクセス
  1. Webブラウザでアクセス確認

# 現時点でのGemバージョン情報
  - ruby '2.6.5'
  - gem 'rails', '= 5.2.3'
  - gem 'pg', '>= 0.18', '< 2.0'
  - gem 'puma', '~> 3.11'
  - gem 'sass-rails', '~> 5.0'
  - gem 'uglifier', '>= 1.3.0'
  - gem 'coffee-rails', '~> 4.2'
  - gem 'turbolinks', '~> 5'
  - gem 'jbuilder', '~> 2.5'
  - gem 'bootsnap', '>= 1.1.0', require: false

### group :development, :test do
  - gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  - gem 'rspec-rails', '~> 3.8'
  - gem 'factory_bot_rails'

### group :development do
  - gem 'web-console', '>= 3.3.0'
  - gem 'listen', '>= 3.0.5', '< 3.2'
  - gem 'spring'
  - gem 'spring-watcher-listen', '~> 2.0.0'

### group :test do
  - gem 'capybara', '>= 2.15'
  - gem 'webdrivers'
### 以下  
- gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
