require 'rails_helper'

RSpec.describe "User", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context "会員登録・ログインができるとき" do
    it "正しい情報を入力すればユーザー新規登録ができてトップページに移動する" do
      #会員登録ページに移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in "user[nick_name]", with: @user.nick_name
      fill_in 'user[full_name]', with: @user.full_name
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      #登録するボタンを押すとユーザーモデルのカウントが1上がる
      #binding.pry
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)      
      #indexページへ遷移する
      visit root_path     
      #会員登録ボタン、ログインボタンが非表示される
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      #新規スケジュールボタン、スケジュール一覧ボタン、ログアウトボタンnick_name,が表示される
      expect(page).to have_content('新規スケジュール')
      expect(page).to have_content('スケジュール一覧')
      expect(page).to have_content('ログアウト')
      #ログアウトボタンを押すと、会員登録、ログイン選択画面に遷移
      click_on "ログアウト"
      #binding.pry
      #ログインボタンをclicしてログイン画面に遷移
      click_on "ログイン"
      #ユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      #indexページへ遷移する
      click_on "ログイン"
      binding.pry
    end
  end
end
