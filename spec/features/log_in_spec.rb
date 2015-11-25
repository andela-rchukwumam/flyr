require "rails_helper"

RSpec.feature "LogIn", type: :feature do
  scenario "with valid email and password" do
    log_in_with "valid@example.com", "password"

    expect(page).to have_content("Log In")
  end

  scenario "with invalid email" do
    log_in_with "invalid_email", "password"

    expect(page).to have_content("Log In")
  end

  scenario "with blank password" do
    log_in_with "valid@example.com", ""

    expect(page).to have_content("Log In")
  end

  def log_in_with(email, password)
    visit login_path
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log In"
  end
end