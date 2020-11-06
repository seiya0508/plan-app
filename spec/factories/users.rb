FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    full_name { 'テストユーザー' }
    password { '000000' }
    password_confirmation { password }
    email { 'aaa@bbb.com' }
  end
end
