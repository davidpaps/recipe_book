require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('recipebooktest')
else
  DatabaseConnection.setup('recipebook')
end