require 'rails_helper'


describe "Log out process" do
  it "will not have the log out button when user is not logged in" do
    visit '/'
    expect(page).to_not have_content 'Log Out'
  end

  it "will have the log out button when user is logged in" do
    user = User.create({email: "k@k.com", password: '12345678'})
    visit 'users/sign_in'
    expect(page).to_not have_content 'Log Out'
    fill_in 'Email', with: "k@k.com"
    fill_in 'Password' , with: "12345678"
    click_on 'Log in'
    expect(page).to have_content 'LogOut'
  end

  it "will log a user out / close a session when user logs out" do
    user = User.create({email: "k@k.com", password: '12345678'})
    visit 'users/sign_in'
    expect(page).to_not have_content 'Log Out'
    fill_in 'Email', with: "k@k.com"
    fill_in 'Password' , with: "12345678"
    click_on 'Log in'
    click_on 'LogOut'
    expect(page).to have_content 'Signed out successfully.'
  end


end
