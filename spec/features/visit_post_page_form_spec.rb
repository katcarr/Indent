require 'rails_helper'

describe "get to new post page" do
  it "goes to new post form from profile page" do
    visit '/posts'
    click_on 'Add Post'
    expect(page).to have_content 'New Post'
  end

end
