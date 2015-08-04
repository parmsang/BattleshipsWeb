require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'registers a name' do
    visit '/'
    click_link 'New Game'
   	fill_in :name, with: 'Dan'
   	click_on 'Submit'
   	expect(page).to have_content "Hello, Dan!"
  end

  scenario 'no name entered' do
  	visit '/'
    click_link 'New Game'
   	fill_in :name, with: ''
   	click_on 'Submit'
   	expect(page).to have_content "Hello, !"
  end

  scenario 'I am asked to enter a board coordinate' do
    visit '/coordinate'
    #click_link 'New Game'
    click_on 'Submit'
    expect(page).to have_content "Please enter board coordinate to shoot at:"
  end

end
