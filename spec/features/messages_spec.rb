require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User creates a new message" do
    visit "/"
    msg_text = "Lorem ipsum dolor sit amet..."
    fill_in "message_message", with: msg_text
    click_button "Save Message"

    expect(page).to have_text("Message successfully created")
  end
  scenario "User fails to create new message with body too large" do
    visit "/"

    fill_in "message_message", with: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    click_button "Save Message"

    expect(page).to have_text("Message is too long (maximum is 150 characters)")
  end
  scenario "User fails to create new message with no body" do
    visit "/"

    fill_in "message_message", with: ""
    click_button "Save Message"

    expect(page).to have_text("Message can't be blank")
  end

end
