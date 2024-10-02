require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'create' do
    article = Article.new(title: 'Title', body: 'Body longer than 10 characters', status: 'public')
    it 'is valid with valid attributes' do
      expect(article).to be_valid
    end
  end
end

