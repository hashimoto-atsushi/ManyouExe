#ユーザー_データ
User.create!(
  [
    {
      name: 'admin',
      email: 'admin@example.com',
      password: 'adminadmin',
      password_confirmation: 'adminadmin',
      admin: 'true'
    },
    {
      name: '山田太郎',
      email: 'yamada@example.com',
      password: 'yamadayamada',
      password_confirmation: 'yamadayamada',
      admin: 'false'
    },
    {
      name: '田中太郎',
      email: 'tanaka@example.com',
      password: 'tanakatanaka',
      password_confirmation: 'tanakatanaka',
      admin: 'false'
    },
    {
      name: '佐藤太郎',
      email: 'sato@example.com',
      password: 'satosato',
      password_confirmation: 'satosato',
      admin: 'false'
    },
    {
      name: '加藤太郎',
      email: 'kato@example.com',
      password: 'katokato',
      password_confirmation: 'katokato',
      admin: 'false'
    },
    {
      name: '杉浦太郎',
      email: 'sugiura@example.com',
      password: 'sugiurasugiura',
      password_confirmation: 'sugiurasugiura',
      admin: 'false'
    },
    {
      name: '羽根田太郎',
      email: 'haneda@example.com',
      password: 'hanedahaneda',
      password_confirmation: 'hanedahaneda',
      admin: 'false'
    },
    {
      name: '松本太郎',
      email: 'matsumoto@example.com',
      password: 'matsumotomatsumoto',
      password_confirmation: 'matsumotomatsumoto',
      admin: 'false'
    },
    {
      name: '津田太郎',
      email: 'tsuda@example.com',
      password: 'tsudatsuda',
      password_confirmation: 'tsudatsuda',
      admin: 'false'
    },
    {
      name: '高田太郎',
      email: 'takada@example.com',
      password: 'takadatakada',
      password_confirmation: 'takadatakada',
      admin: 'false'
    },
    {
      name: '竹内太郎',
      email: 'takeuchi@example.com',
      password: 'takeuchitakeuchi',
      password_confirmation: 'takeuchitakeuchi',
      admin: 'false'
    }
  ]
)
#ラベル_データ
sticker_names = ["打合せ", "社外秘", "共有", "告知", "重要", "機密", "出張資料", "休暇後", "出金清算", "トラブル関連"]
sticker_names.each do |sticker_name|
  Sticker.create!(sticker_name: sticker_name)
end


(1..10).each do |i|
Task.create!(
  [
    {
      task_name: '洗濯',
      task_detail: '洗濯する',
      due: '2020-01-01'.to_date,
      status: '完了',
      priority: '高',
      user_id: "#{i}"
    },
    {
      task_name: '掃除',
      task_detail: '掃除する',
      due: '2020-08-02'.to_date,
      status: '着手中',
      priority: '中',
      user_id: "#{i}"
    },
    {
      task_name: '布団干し',
      task_detail: '布団を干す',
      due: '2020-06-03'.to_date,
      status: '完了',
      priority: '高',
      user_id: "#{i}"
    },
    {
      task_name: 'ゴミ出し',
      task_detail: 'ゴミ出しをする',
      due: '2020-12-04'.to_date,
      status: '未着手',
      priority: '中',
      user_id: "#{i}"
    },
    {
      task_name: '炊事',
      task_detail: '食事の用意をする',
      due: '2020-11-05'.to_date,
      status: '着手中',
      priority: '低',
      user_id: "#{i}"
    },
    {
      task_name: 'アイロン',
      task_detail: 'アイロンする',
      due: '2020-07-06'.to_date,
      status: '完了',
      priority: '高',
      user_id: "#{i}"
    },
    {
      task_name: '洗車',
      task_detail: '洗車する',
      due: '2020-03-07'.to_date,
      status: '未着手',
      priority: '中',
      user_id: "#{i}"
    },
    {
      task_name: 'パソコン修理',
      task_detail: 'パソコン修理をする',
      due: '2020-06-08'.to_date,
      status: '着手中',
      priority: '高',
      user_id: "#{i}"
    },
    {
      task_name: 'お誕生日会',
      task_detail: 'お誕生日会の準備をする',
      due: '2020-05-09'.to_date,
      status: '着手中',
      priority: '低',
      user_id: "#{i}"
    },
    {
      task_name: '庭の手入れ',
      task_detail: '庭の手入れをする',
      due: '2020-02-10'.to_date,
      status: '完了',
      priority: '高',
      user_id: "#{i}"
    }
  ]
)
end
