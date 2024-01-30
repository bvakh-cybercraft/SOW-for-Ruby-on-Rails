require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without an email" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "is not valid without a password" do
    user.password = nil
    expect(user).not_to be_valid
  end

  it "is not valid with an invalid email format" do
    invalid_user = build(:user, email: 'not_an_email')
    expect(invalid_user).not_to be_valid
  end

  it "is not valid with a too short password" do
    user.password = 'short'
    expect(user).not_to be_valid
  end

  it "is not valid with a too long password" do
    user.password = 'a' * 129
    expect(user).not_to be_valid
  end

  it "is not valid with a password containing spaces" do
    user.password = 'pass word'
    expect(user).not_to be_valid
  end

  it "is not valid with a password containing only spaces" do
    user.password = '   '
    expect(user).not_to be_valid
  end
end
