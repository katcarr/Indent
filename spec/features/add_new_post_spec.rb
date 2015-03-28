require 'rails_helper'


describe "add new post process" do
  it "will not allow a new post without logging in" do
    visit '/'
    click_on 'Add Post'
    expect(page).to have_content 'Please log in to create a new post'
  end

  it "will return error message if title is empty" do
    user = FactoryGirl.create(:user)
    sign_in_user(user)
    visit 'posts/new'
    fill_in 'Content', with: "Stuff to know"
    click_on 'Post'
    expect(page).to have_content 'There was a problem submitting your post'
  end

  it "will return error message if content is empty" do
    user = FactoryGirl.create(:user)
    sign_in_user(user)
    visit 'posts/new'
    fill_in 'Title', with: "Stuff to know"
    click_on 'Post'
    expect(page).to have_content 'There was a problem submitting your post'
  end

  it "will returns to posts page when post is successfully created with sucess message" do
    user = FactoryGirl.create(:user)
    sign_in_user(user)
    visit 'posts/new'
    fill_in 'Title', with: "Stuff to know"
    fill_in 'Content', with: "Stuff to know and more stuff"
    click_on 'Post'
    expect(page).to have_content 'Post posted'
  end
end
