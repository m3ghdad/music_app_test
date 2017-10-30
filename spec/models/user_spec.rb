require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    User.new(email: 'm@m.com', password:'123456')
  end

  describe 'validations' do

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    # it {should validate_uniqueness_of(:email) }
    # it {should validate_presence_of(:session_token)}
    # it {should validate_uniqueness_of(:session_token)}
  end


  describe 'associations' do

  end

  describe 'class methods' do

  end

end
