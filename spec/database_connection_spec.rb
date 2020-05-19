require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up up a connection to the database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'recipebooktest')
      DatabaseConnection.setup('recipebooktest')
    end
  end

  describe '.connection' do
    it 'has a persistant connection' do
      connection = DatabaseConnection.setup('recipebooktest')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '.query' do
    it 'executes a query via pg' do
      connection = DatabaseConnection.setup('recipebooktest')
      expect(connection).to receive(:exec).with("SELECT * FROM recipes;")

      DatabaseConnection.query("SELECT * FROM recipes;")
    end
  end
end