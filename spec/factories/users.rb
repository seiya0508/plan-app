FactoryBot.define do
  factory :user do
    nick_name {'test'}
    full_name {'テストユーザー'}
    passowrd {'000000'}
    password_confirmation {password}
    email {'aaa@bbb.com'}
  end
end