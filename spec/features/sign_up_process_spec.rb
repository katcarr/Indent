require 'rails_helper'


describe "the sign up process" do
  it "will display the sign up button on the home page" do
    visit '/'
    expect(page).to have_content 'Sign Up'
  end

  it "will create a new user when new user form is filled out correctly" do
    visit 'users/sign_up'
    fill_in 'Email', with: "k@k.com"
    fill_in 'Password' , with: "12345678"
    fill_in 'Password confirmation' , with: "12345678"
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it "will provide an error message when form is not filled out correctly" do
    visit 'users/sign_up'
    fill_in 'Email', with: ""
    fill_in 'Password' , with: "12345678"
    fill_in 'Password confirmation' , with: "12345678"
    click_on 'Sign up'
    expect(page).to have_content 'error'
  end



end
