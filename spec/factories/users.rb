FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    full_name { 'テストユーザー' }
    password { '00000a' }
    password_confirmation { '00000a' }
    email { 'aaa@bbb.com.1' }
  end
end
