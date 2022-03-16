require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
  before do 
    @user = User.create! name: 'test', email: 'test@test.com', password: 'test-password', password_confirmation: 'test-password'
  end 

  scenario "They click on login, input information and redirected to homepage" do
    # ACT
    visit root_path
    expect(page).to have_content 'Login'

    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Submit'

    # DEBUG
    save_and_open_screenshot

    # VERIFY
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Products'
  end

end
