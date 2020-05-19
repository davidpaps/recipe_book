# frozen_string_literal: true

require 'pg'

p 'Setting up the Test Database...!'

def setup_test_database
  connection = PG.connect(dbname: 'recipebooktest')
  connection.exec('TRUNCATE recipes')
end
