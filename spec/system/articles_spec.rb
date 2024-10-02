require 'rails_helper'

RSpec.describe "Articles", type: :system do
  before do
    driven_by(:rack_test)
  end

  context 'creating very first article' do
    article_title = 'Test Article'

    it 'creates a new Article' do
      
      visit articles_path
      
      click_link 'New Article'
      expect(page).to have_text("New Article")

      fill_in 'Title', with: article_title
      fill_in 'Body', with: 'This is a test article.'
      click_button 'Create Article'
      expect(page).to have_text(article_title)
    end

    it 'creates a comment' do
      visit articles_path

      click_link 'New Article'
      
      fill_in 'Title', with: article_title
      fill_in 'Body', with: 'This is a test article.'
      click_button 'Create Article'
      expect(page).to have_text(article_title)

      fill_in 'Commenter', with: 'John Doe'
      fill_in 'Body', with: 'This is a very nasty test comment.'
      click_button 'Create Comment'

      expect(page).to have_text('John Doe')
    end
  end
end
