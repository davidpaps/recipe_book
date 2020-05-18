require 'pg'

class Recipe

  def self.all
    connection = PG.connect(dbname: 'recipebook')
    result = connection.exec("SELECT * FROM recipes;")
    result.map {|recipe| recipe['url']}
  end

end