# frozen_string_literal: true

require 'pg'
require_relative 'database_connection'
require_relative 'comment'
require 'uri'

class Recipe
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM recipes;')
    result.map { |recipe| new(recipe['id'], recipe['title'], recipe['url']) }
  end

  def self.create(url, title)
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO recipes (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.update(id, url, title)
    result = DatabaseConnection.query("UPDATE recipes SET url= '#{url}', title= '#{title}' WHERE id= '#{id}'")
  end

  def self.delete(id)
    result = DatabaseConnection.query("DELETE FROM recipes WHERE id = '#{id}'")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM recipes WHERE id = #{id};")
    new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def comments(comment_class = Comment)
    comment_class.where(id)
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
