# frozen_string_literal: true

require 'pg'

class Recipe
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'recipebooktest')
                 else
                   PG.connect(dbname: 'recipebook')
                 end

    result = connection.exec('SELECT * FROM recipes;')
    result.map { |recipe| new(recipe['id'], recipe['title'], recipe['url']) }
  end

  def self.create(url, title)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'recipebooktest')
                 else
                   PG.connect(dbname: 'recipebook')
                 end

    result = connection.exec("INSERT INTO recipes (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.update(id, url, title)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'recipebooktest')
                 else
                   PG.connect(dbname: 'recipebook')
    end

    result = connection.exec("UPDATE recipes SET url= '#{url}', title= '#{title}' WHERE id= '#{id}'")
  end

  def self.delete(id)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'recipebooktest')
                 else
                   PG.connect(dbname: 'recipebook')
    end

    result = connection.exec("DELETE FROM recipes WHERE id = '#{id}'")
  end
end
