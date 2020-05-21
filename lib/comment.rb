# frozen_string_literal: true

require_relative 'database_connection'

class Comment
  attr_reader :id, :description, :recipe_id

  def initialize(id, description, recipe_id)
    @id = id
    @description = description
    @recipe_id = recipe_id
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM comments')
    result.map { |comment| new(comment['id'], comment['description'], comment['recipe_id']) }
  end

  def self.create(description, recipe_id)
    result = DatabaseConnection.query("INSERT INTO comments (recipe_id, description) VALUES ('#{recipe_id}','#{description}') RETURNING id, description, recipe_id;")
    new(result[0]['id'], result[0]['description'], result[0]['recipe_id'])
  end

  def self.where(recipe_id)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE recipe_id = #{recipe_id};")
    result.map { |comment| new(comment['id'], comment['description'], comment['recipe_id']) }
  end
end
