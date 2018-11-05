require 'rails_helper'


RSpec.describe Article, :type => :controller do

	it "is not possible to destroy an article that is not mine" do
		current_user = User.find(1)
		visit articles_path
		find.(link_to article_path(3), method: :delete).click
		expect(Article.find(3).present?).to_be valid?
	end

end