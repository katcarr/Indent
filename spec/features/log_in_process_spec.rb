require 'rails_helper'


describe "the log in process" do
  it "will display the sign up button on the home page" do
    visit '/'
    expect(page).to have_content 'LogIn'
  end

  it "will Log In user when form is filled out correctly" do
    User.create({email: "k@k.com", password: "12345678"})
    visit 'users/sign_in'
    fill_in 'Email', with: "k@k.com"
    fill_in 'Password' , with: "12345678"
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "will provide an error message when password is not filled out correctly" do
    visit 'users/sign_in'
    fill_in 'Email', with: "k@k.com"
    fill_in 'Password' , with: "1234567"
    click_on 'Log in'
    expect(page).to have_content 'Invalid'
  end



end
