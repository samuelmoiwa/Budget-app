require 'rails_helper'

RSpec.describe 'Group index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Elie', email: 'test@gmail.com', password: 'password')
    @group = Group.create(author: @user, name: 'Food', icon: 'https://icon_url')
    visit new_user_session_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit user_groups_path(@user.id)
  end

  scenario 'I can see the page title.' do
    expect(page).to have_content 'Categories'
  end
  scenario 'I can see the group name.' do
    expect(page).to have_content 'Food'
  end
  scenario 'I can see the group total transaction.' do
    expect(page).to_not have_content 'Total: $'
  end
end
