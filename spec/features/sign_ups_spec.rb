require "rails_helper"

RSpec.feature "SignUp", type: :feature do
  scenario "with valid email and password" do
    sign_up_with "ruth", "valid@example.com", "123456", "123456"

    expect(page).to have_content("Sign Up")
  end

  scenario "with invalid email" do
    sign_up_with "", "invalid_email", "password", "password"

    expect(page).to have_content("Sign Up")
  end

  scenario "with blank password" do
    sign_up_with "", "valid@example.com", "", ""

    expect(page).to have_content("Sign Up")
  end

  def sign_up_with(name, email, password, confirmpassword)
    visit signup_path
    fill_in "Name", with: name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Confirm Password", with: confirmpassword
    click_button "Sign Up"
  end
end
