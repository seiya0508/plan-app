require 'rails_helper'

RSpec.describe "Garbages", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @garbage = FactoryBot.build(:garbage)
  end

  context "新規登録ができるとき" do
    it "正しい情報を入力すれば新規登録ができて、showページへ移動して削除できる" do
      #ログインページへ遷移
      visit new_user_session_path
      #ユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      #indexページへ遷移する
      click_on "ログイン"
      #新規登録ページに移動する
      click_on "新規スケジュール"
      #新規登録情報を入力する
      select '日曜', from: 'garbage[dow]'
      fill_in 'garbage[title]', with: @garbage.title
      #登録するボタンを押すとgarbageモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change { Garbage.count }.by(1)
      #スケジュール一覧ページへ移動
      click_on "スケジュール一覧"
      #編集ページへ移動
      click_on "タイトル"
      #予定を削除し、Topページへ移動する
      click_button "予定を削除"
      #binding.pry
    end
  end
  context "新規登録ができないとき" do
    it "誤った情報を入力すれば新規登録ができずに新規登録ページへ戻ってくる" do
      #ログインページへ遷移
      visit new_user_session_path
      #ユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      #indexページへ遷移する
      click_on "ログイン"
      #新規登録ページに移動する
      click_on "新規スケジュール"
      #新規登録情報を入力する
      select '必須入力', from: 'garbage[dow]'
      fill_in 'garbage[title]', with: nil
      #登録するボタンを押すとgarbageモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change { Garbage.count }.by(0)
    end
  end
end




