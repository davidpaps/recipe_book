# frozen_string_literal: true

require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create('test@test.com', 'password')

      expect(user).to be_a(User)
      expect(user.email).to eq('test@test.com')
    end

    it 'hashes the password using bcrypt' do
      expect(BCrypt::Password).to receive(:create).with('password')

      User.create('test@test.com', 'password')
    end
  end

  describe '.find' do
    it 'finds a user by id' do
      user = User.create('test@test.com', 'password')
      result = User.find(user.id)

      expect(result.id).to eq(user.id)
      expect(result.email).to eq(user.email)
    end

    it 'returns nil if there is no id given' do
      expect(User.find(nil)).to eq(nil)
    end
  end
end
