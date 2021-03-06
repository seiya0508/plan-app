require 'rails_helper'

RSpec.describe 'User', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context '会員登録・ログインができるとき' do
    it '正しい情報を入力すれば会員登録(ログイン)ができ、トップページ(ログイン状態)に移動する' do
      # 会員登録ページに移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nick_name]', with: @user.nick_name
      fill_in 'user[full_name]', with: @user.full_name
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      # 登録するボタンを押すとユーザーモデルのカウントが1上がり、Topページへ移動(ログイン中のユーザーnick_name表示)
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      # 会員登録ボタン、ログインボタンが非表示される
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      # 新規スケジュール、スケジュール一覧、ログアウトが表示される
      expect(page).to have_content('新規スケジュール')
      expect(page).to have_content('スケジュール一覧')
      expect(page).to have_content('ログアウト')
      # ログアウトボタンを押すと、会員登録、ログイン選択画面に遷移
      click_on 'ログアウト'
      # ログインボタンをclicしてログイン画面に遷移
      click_on 'ログイン'
      # ユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      # indexページへ遷移する
      click_on 'ログイン'
    end
  end
  context '会員登録ができないとき' do
    it '誤った情報ではユーザー会員登録(ログイン)ができず、会員登録(ログイン)ページへ戻ってくる' do
      # 会員登録ページに移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nick_name]', with: nil
      fill_in 'user[full_name]', with: nil
      fill_in 'user[email]', with: nil
      fill_in 'user[password]', with: nil
      fill_in 'user[password_confirmation]', with: nil
      # 登録するボタンを押すとユーザーモデルのカウントは上がらず、エラーメッセージが表示
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)
      # 会員登録、ログイン選択画面に遷移
      click_button '戻る'
      # ログインボタンをclicしてログイン画面に遷移
      click_on 'ログイン'
      # ユーザー情報を入力する
      fill_in 'user[email]', with: nil
      fill_in 'user[password]', with: nil
      # ログインボタンをclicしてログイン画面に戻り、エラーメッセージが表示
      click_on 'ログイン'
    end
  end
end
