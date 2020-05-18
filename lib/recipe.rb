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

end