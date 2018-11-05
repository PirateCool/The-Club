require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is valid with valid attributes" do
   user = User.new(first_name:"Ugo", last_name:"Gessa", email:"i.am.ugogessa@gmail.com", password: "motdepasse", password_confirmation: "motdepasse")
   expect(user).to be_valid
  end

  it "is not valid without a first_name" do
     expect(User.new(first_name: nil, last_name:"Gessa", email:"i.am.ugo@gmail.com", password: "motdepasse", password_confirmation: "motdepasse")).to_not be_valid
  end

  it "is not valid without a last_name" do
       expect(User.new(first_name: "Ugo", last_name: nil, email:"i.am.ugo@gmail.com", password: "motdepasse", password_confirmation: "motdepasse")).to_not be_valid
  end

  it "is not valid without a unique email" do
    	@user1 = User.new(first_name: "Example",last_name:"User", email: "user@example.com", password: "motdepasse", password_confirmation: "motdepasse")
 		@user2 = User.new(first_name: "Example",last_name:"User", email: "user@example.com", password: "motdepasse", password_confirmation: "motdepasse")

  	   	@user1.save
  	   	@user2.save
  	   	expect(@user2).to_not be_valid
  end

end

RSpec.describe Article :type => :controller do

	it "is not possible to destroy an article that is not mine" do
		current_user = User.find(1)
		visit articles_path
		page.find(:xpath,"/html/body/div/div[2]/table/tbody[1]/tr/td[7]/a").click
		expect page.to_be article_path
	end

end
