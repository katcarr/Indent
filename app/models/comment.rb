class Comment<ActiveRecord::Base
  validates :thoughts, presence: true
  before_create :send_text
  belongs_to :post
  belongs_to :user

private
  def send_text
    begin
      response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/ACdfe6985fccb1485c15e3cabe55a1c35b/Messages.json',
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => "Some one made a comment on your "+ self.post.title + " post.",
                    :To => ENV['OUR_TO_TWILIO_NUMBER'], #should be self.post.user.number in real world
                    :From => ENV['OUR_TWILIO_NUMBER'] }
    ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end


end
