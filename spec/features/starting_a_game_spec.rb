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
    visit '/new_game'
    fill_in :name, with: 'Dave'
    click_on 'Submit'
    click_link 'Enter game'
    expect(page).to have_content "Please enter board coordinate to shoot at:"
  end

  scenario 'should hit on the board' do
    visit '/coordinate'
    fill_in :coordinate, with: 'D4'
    click_on 'Submit'
    expect(page).to have_content "Miss!"
  end

end
