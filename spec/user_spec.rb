# frozen_string_literal: true

require 'user'
require 'web_helper'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = create_user

      expect(user).to be_a(User)
      expect(user.email).to eq('test@test.com')
    end

    it 'hashes the password using bcrypt' do
      expect(BCrypt::Password).to receive(:create).with('password')
      create_user
    end
  end

  describe '.find' do
    it 'finds a user by id' do
      user = create_user
      result = User.find(user.id)

      expect(result.id).to eq(user.id)
      expect(result.email).to eq(user.email)
    end

    it 'returns nil if there is no id given' do
      expect(User.find(nil)).to eq(nil)
    end
  end

  describe '.authenticate' do
    it 'if a user exists + password matches, it returns a user' do
      user = create_user
      authenticated_user = User.authenticate('test@test.com', 'password')
      expect(authenticated_user.id).to eq(user.id)
    end

    it 'returns nil if an incorrect email address is given' do
      user = create_user
      expect(User.authenticate('wrongtest@test.com', 'password')).to be_nil
    end
  end
end
