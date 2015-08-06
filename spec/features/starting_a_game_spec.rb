require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  feature 'Entering player 1 & player 2 names' do
    scenario 'registers a name' do
      visit '/'
      click_link 'New Game'
      fill_in :name, with: 'Dan'
      fill_in :name2, with: 'Ed'
      click_on 'Submit'
      expect(page).to have_content 'Hello, Dan and Ed!'
    end

    scenario 'no name entered' do
      visit '/'
      click_link 'New Game'
      fill_in (:name or :name2) , with: ''
      click_on 'Submit'
      expect(page).to have_content 'Hello, and !'
    end
  end
end

feature 'playing a new game' do
  feature 'player 1 playing a game' do
    scenario "can place ships" do
      visit '/'
      click_link 'New Game'
      click_button 'Submit'
      click_link 'Enter Player 1 Board'
      expect(page).to have_content "Where do you want to place your ship?"
      fill_in "coordinate", with: "E4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "A1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      expect(page).to have_content "Where do you want to place your ship?"
    end

    scenario 'can see a player 1 board' do
      game = Game.new Player, Board
      board = game.opponent_board_view game.player_1
      visit '/new_game'
      click_button 'Submit'
      click_link 'Enter Player 1 Board'
      fill_in "coordinate", with: "e4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "a1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      fill_in "coordinate", with: "e4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "a1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      expect(page).to have_content board
    end

    scenario 'I am asked to enter a board coordinate' do
      visit '/new_game'
      fill_in "name", with: 'Dave'
      click_button 'Submit'
      click_link 'Enter Player 1 Board'
      fill_in "coordinate", with: "e4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "a1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      fill_in "coordinate", with: "e4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "a1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      expect(page).to have_content 'Please enter board coordinate to shoot at:'
    end

    scenario 'should hit on the board' do
      visit '/'
      click_link 'New Game'
      click_button 'Submit'
      click_link 'Enter Player 1 Board'
      fill_in "coordinate", with: "e4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "a1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      fill_in "coordinate", with: "e4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "a1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      fill_in "coordinate", with: 'D4'
      click_button 'Submit'
      expect(page).to have_content 'miss' or 'hit'
    end

    scenario 'should hit the ship' do
      visit '/'
      click_link 'New Game'
      click_button 'Submit'
      click_link 'Enter Player 1 Board'
      fill_in "coordinate", with: "e4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "a1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      fill_in "coordinate", with: "e4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "a1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      fill_in "coordinate", with: 'E4'
      click_button 'Submit'
      expect(page).to have_content 'hit'
    end

  #   scenario 'should sink the ship' do
  #     visit '/'
  #     click_link 'New Game'
  #     click_button 'Submit'
  #     click_link 'Enter Player 1 Board'
  #     fill_in "coordinate", with: 'E4'
  #     click_button 'Submit'
  #     fill_in "coordinate", with: 'F4'
  #     click_button 'Submit'
  #     expect(page).to have_content 'sunk'
  #   end
  end

  feature 'player 2 playing a game' do
    scenario "can place ships" do
      visit '/'
      click_link 'New Game'
      click_button 'Submit'
      click_link 'Enter Player 1 Board'
      expect(page).to have_content "Where do you want to place your ship?"
      fill_in "coordinate", with: "E4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "A1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      expect(page).to have_content "Where do you want to place your ship?"
      fill_in "coordinate", with: "E4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "A1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      expect(page).to have_content 'Please enter board coordinate to shoot at:'
    end
    scenario 'can see a player 2 board' do
      game = Game.new Player, Board
      board = game.opponent_board_view game.player_2
      visit '/new_game'
      click_button 'Submit'
      click_link 'Enter Player 1 Board'
      fill_in "coordinate", with: "E4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "A1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      fill_in "coordinate", with: "E4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "A1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      expect(page).to have_content board
    end

    scenario 'I am asked to enter a board coordinate' do
      visit '/new_game'
      visit '/'
      click_link 'New Game'
      click_button 'Submit'
      click_link 'Enter Player 1 Board'
      fill_in "coordinate", with: "E4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "A1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      fill_in "coordinate", with: "E4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "A1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      expect(page).to have_content 'Please enter board coordinate to shoot at:'
    end

    scenario 'should hit on the board' do
      visit '/'
      click_link 'New Game'
      click_button 'Submit'
      click_link 'Enter Player 1 Board'
      expect(page).to have_content "Where do you want to place your ship?"
      fill_in "coordinate", with: "E4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "A1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      expect(page).to have_content "Where do you want to place your ship?"
      fill_in "coordinate", with: "E4"
      fill_in "rotation", with: "vertical"
      fill_in "coordinate2", with: "A1"
      fill_in "rotation2", with: "horizontal"
      click_button "Submit"
      fill_in "coordinate", with: 'D4'
      click_button 'Submit'
      fill_in "coordinate2", with: 'D4'
      click_button 'Submit'
      expect(page).to have_content 'miss' or 'hit'
    end

  #   scenario 'should hit the ship' do
  #     visit '/'
  #     click_link 'New Game'
  #     click_button 'Submit'
  #     click_link 'Enter Player 2 Board'
  #     fill_in "coordinate2", with: 'E4'
  #     click_button 'Submit'
  #     expect(page).to have_content 'hit'
  #   end

  #   scenario 'should sink the ship' do
  #     visit '/'
  #     click_link 'New Game'
  #     click_button 'Submit'
  #     click_link 'Enter Player 2 Board'
  #     fill_in "coordinate2", with: 'E4'
  #     click_button 'Submit'
  #     fill_in "coordinate2", with: 'F4'
  #     click_button 'Submit'
  #     expect(page).to have_content 'sunk'
  #   end
  end
end
