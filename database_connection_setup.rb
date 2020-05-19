require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  PG.connect(dbname: 'recipebooktest')
else
  PG.connect(dbname: 'recipebook')
end