require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  	scenario 'with valid email and password' do
        sign_up_with 'valid@example.com', 'password'

        expect(page).to have_content('Sign Up')
  	end

  	scenario 'with invalid email' do
        sign_up_with 'invalid_email', 'password'

        expect(page).to have_content('Sign Up')
  	end

  	scenario 'with blank password' do
        sign_up_with 'valid@example.com', ''

        expect(page).to have_content('Sign Up')
  	end

    def sign_up_with(email, password)
      visit signup_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign Up'
    end
end
