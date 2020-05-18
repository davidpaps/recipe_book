require 'pg'

def persisted_data(id)
  connection = PG.connect(dbname: 'recipebooktest')
  result = connection.query("SELECT * FROM recipes WHERE id = #{id};")
  result.first
end