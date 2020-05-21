# frozen_string_literal: true

require_relative 'database_connection'

class User
  attr_reader :id, :email

  def initialize(id, email)
    @id = id
    @email = email
  end

  def self.create(email, password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email;")
    new(result[0]['id'], result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    new(result[0]['id'], result[0]['email'])
  end
end
