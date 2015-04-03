require 'rails_helper'

describe Comment do
  it {should validate_presence_of :thoughts}

  it {should belong_to :post}
  it {should belong_to :user}

  it 'sends a text message to the user who posted the' do
    user  = FactoryGirl.create(:user)
    post  = FactoryGirl.create(:post, user_id: user.id)
    comment = FactoryGirl.create(:comment, user_id: user.id , post_id: post.id)
    comment.errors.messages[:base].should eq nil
  end


end
