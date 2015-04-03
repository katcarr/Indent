FactoryGirl.define do

  factory(:user) do
    email('test@test.com')
    password('12345678')
  end

  factory(:post) do
    title("Awesome sauce")
    content("Is good to eat")
    date(Date.today)
  end

  factory(:comment) do
    thoughts("Great post!")
  end

end
