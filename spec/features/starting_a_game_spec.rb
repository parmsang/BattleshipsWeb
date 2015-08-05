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
    expect(page).to have_content 'Hello, Dan!'
  end

  scenario 'no name entered' do
    visit '/'
    click_link 'New Game'
    fill_in :name, with: ''
    click_on 'Submit'
    expect(page).to have_content 'Hello, !'
  end
end

feature 'playing a new game' do
  scenario 'can see a board' do
    game = Game.new Player, Board
    board = game.opponent_board_view game.player_1
    visit '/'
    click_link 'New Game'
    click_button 'Submit'
    click_link 'Enter game'
    expect(page).to have_content board
  end

  scenario 'I am asked to enter a board coordinate' do
    visit '/new_game'
    fill_in "name", with: 'Dave'
    click_button 'Submit'
    click_link 'Enter game'
    expect(page).to have_content 'Please enter board coordinate to shoot at:'
  end

  scenario 'should hit on the board' do
    visit '/'
    click_link 'New Game'
    click_button 'Submit'
    click_link 'Enter game'
    fill_in "coordinate", with: 'D4'
    click_button 'Submit'
    expect(page).to have_content 'miss' or 'hit'
  end

  scenario 'should hit the ship' do
    visit '/'
    click_link 'New Game'
    click_button 'Submit'
    click_link 'Enter game'
    fill_in "coordinate", with: 'E4'
    click_button 'Submit'
    expect(page).to have_content 'hit'
  end

  scenario 'should sink the ship' do
    visit '/'
    click_link 'New Game'
    click_button 'Submit'
    click_link 'Enter game'
    fill_in "coordinate", with: 'E4'
    click_button 'Submit'
    fill_in "coordinate", with: 'F4'
    click_button 'Submit'
    expect(page).to have_content 'sunk'
  end

end
