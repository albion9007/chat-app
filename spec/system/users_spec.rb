require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない場合、サインページに移動する' do
    # トップページに遷移する
    visit root_path

    # ログインしていない場合、サインページに遷移する事を期待する
    expect(current_path).to eq new_user_session_path

  end

  it 'ログインに成功し、ルートパスに遷移する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # サインページへ移動する
    visit new_user_session_path

    # ログインしていない場合、サインページに遷移する事を期待する
    expect(current_path).to eq new_user_session_path

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    # ログインボタンをクリックする
    click_on("Log in")

    # ルートページに遷移する事を期待する
    expect(current_path).to eq root_path

  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # トップページに遷移する
    visit root_path

    #ログインしていない場合、サインインページに遷移する事を期待する
    expect(current_path).to eq new_user_session_path
    
    #誤ったユーザー情報を入力する
    fill_in 'user_email', with: ""
    fill_in 'user_password', with: ""

    #ログインボタンをクリックする
    click_on("Log in")

    #サインインページに遷移している事を期待する
    expect(current_path).to eq new_user_session_path
  end

end
