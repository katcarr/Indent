require 'rails_helper'


describe "add new post process" do
  it "will not display edit and delete buttons if post  does not belong to current user" do
    user_post = FactoryGirl.create(:user)
    test_post = Post.create({title: "How to be amazing", content: "Do stuff", date: Date.today, user_id: user_post.id})
    new_user = FactoryGirl.create(:user, email: "new@new.com")
    sign_in_user(new_user)
    visit post_path(test_post)
    expect(page).to_not have_content 'Edit Post'
  end

  it "will only display edit and delete buttons if post belongs to current user" do
    user_post = FactoryGirl.create(:user)
    test_post = Post.create({title: "How to be amazing", content: "Do stuff", date: Date.today, user_id: user_post.id})
    sign_in_user(user_post)
    visit post_path(test_post)
    expect(page).to have_content 'Edit Post'
  end

  it "will change the title when owner of the post edits the post" do
    user_post = FactoryGirl.create(:user)
    test_post = Post.create({title: "How to be amazing", content: "Do stuff", date: Date.today, user_id: user_post.id})
    sign_in_user(user_post)
    visit post_path(test_post)
    click_on 'Edit Post'
    fill_in 'Title', with: "How to be an amazing coder"
    fill_in 'Content', with: "Do it everyday."
    click_on 'Post'
    expect(page).to have_content 'How to be an amazing coder'
  end


end
