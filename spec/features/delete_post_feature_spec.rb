require 'rails_helper'

describe 'deleting post process' do
  it "will go to post's page when comment button hit" do
    user = FactoryGirl.create(:user)
    sign_in_user(user)
    Post.create({title: "How to be amazing", content: "Do stuff", date: Date.today, user_id: user.id})
    visit 'posts'
    click_on "How to be amazing"
    click_on 'Delete Post'
    expect(page).to have_content "Post deleted"
  end

end
