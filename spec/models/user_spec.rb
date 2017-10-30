require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    user = User.new(email: 'm@m.com', password:'123456')
  end

  describe 'validations' do

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6)}
    it {should validate_uniqueness_of(:email) }
    it {should validate_presence_of(:session_token)}
    it {should validate_uniqueness_of(:session_token)}
  end


  # describe 'associations' do
  #
  # end

  describe 'class methods' do
    # Test #is_password?
    # Test #reset_session_token
    # Test ::find_by_credentials
    describe '#is_password?' do
      it 'should verify password is correct' do
        # expect(user.is_password?('123456')).to be true
      end
      it 'should verify password is not correct' do
        # expect(user.is_password?('654321')).to be false
      end
    end

    describe '#reset_session_token!' do
      it 'set a new session_token' do
        # user.valid?
        # old_session_token = user.session_token
        # user.reset_session_token!
        #
        # expect(user.session_token).to_not eq(old_session_token)
      end

      it 'returns the new session token' do

      end

    end


  end

end
