require 'pg'

class Recipe

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'recipebooktest')
    else
    connection = PG.connect(dbname: 'recipebook')
    end

    result = connection.exec("SELECT * FROM recipes;")
    result.map {|recipe| recipe['url']}
  end

  def self.create(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'recipebooktest')
    else
    connection = PG.connect(dbname: 'recipebook')
    end

  connection.exec("INSERT INTO recipes (url) VALUES('#{url}')")

  end

end