require 'pg'

class Recipe

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'recipebooktest')
    else
    connection = PG.connect(dbname: 'recipebook')
    end

    result = connection.exec("SELECT * FROM recipes;")
    result.map {|recipe| self.new(recipe['id'], recipe['title'], recipe['url'])}
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'recipebooktest')
    else
    connection = PG.connect(dbname: 'recipebook')
    end

  connection.exec("INSERT INTO recipes (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")

  end

end