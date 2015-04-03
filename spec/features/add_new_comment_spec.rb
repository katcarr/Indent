require 'rails_helper'

describe "add new comment to a post process" do
  it "will go to post's page when any part of post is clicked" do
    user = FactoryGirl.create(:user)
    sign_in_user(user)
    Post.create({title: "How to be amazing", content: "Do stuff", date: Date.today, user_id: user.id})
    visit 'posts'
    click_on "How to be amazing"
    expect(page).to have_content "Comment"
  end

  it "will list comment on the post's page after comment is created", js: true do
    user = FactoryGirl.create(:user)
    Post.create({title: "How to be amazing", content: "Do stuff", date: Date.today, user_id: user.id})
    visit 'posts'
    click_on "How to be amazing"
    click_on 'Comment'
    fill_in "Thoughts", with: "Wow so cool"
    click_on 'Comment'
    expect(page).to have_content "Wow so cool"
  end

  it "will give error message if comment field is left blank", js: true do
    user = FactoryGirl.create(:user)
    Post.create({title: "How to be amazing", content: "Do stuff", date: Date.today, user_id: user.id})
    sign_in_user(user)
    visit 'posts'
    click_on "How to be amazing"
    fill_in "Thoughts", with: ""
    click_on 'Comment'
    expect(page).to have_content "Something went wrong when commenting"
  end

end
