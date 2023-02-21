require 'rails_helper'

RSpec.describe Budget, type: :model do
  before(:each) do
    @user = User.create(name: 'Elie', email: 'test@gmail.com', password: 'password')
    @group = Group.create(user: @user, name: 'Food', icon: 'https://icon_url')
    @budget = Budget.create(user: @user, name: 'Chips', amount: 15)
  end

  scenario 'it should be valid' do
    expect(@budget).to be_valid
  end
end
