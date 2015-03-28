require 'rails_helper.rb'

describe "the user profile page" do
  it "if the user is not authenticated a link to a user's profile will not be displayed" do
    user = FactoryGirl.create(:user)
    visit '/'
    expect(page).to_not have_content 'My Blogs'
  end

  it "if the user is authenticated a link to a user's profile will be displayed" do
    user = FactoryGirl.create(:user)
    sign_in_user(user)
    visit '/'
    expect(page).to have_content 'My Blogs'
  end

  it "authenticated user can visit their profile page" do
    user = FactoryGirl.create(:user)
    sign_in_user(user)
    visit '/'
    click_on 'My Blogs'
    expect(current_path).to eql(user_path(user))
  end

  it "user's profile page will display all user's post" do
    user = FactoryGirl.create(:user)
    sign_in_user(user)
    test_post = Post.create({title: "How to be amazing", content: "Do stuff", date: Date.today, user_id: user.id})
    visit '/'
    click_on 'My Blogs'
    expect(page).to have_content "How to be amazing"
  end



end
