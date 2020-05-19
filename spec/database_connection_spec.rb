require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up up a connection to the database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'recipebooktest')
      DatabaseConnection.setup('recipebooktest')
    end
    
  end
end