require 'rails_helper'

RSpec.describe "ReadCsvs", type: :request do
  describe "POST /import_csv" do
    it "processes a CSV file and returns a 200 status" do
      # DADO
      csv_file = fixture_file_upload('public/netflix_titles.csv', 'text/csv')
      # QUANDO
      post '/api/import_csv', params: { csv_file: csv_file }
      # ENTAO
      expect(response.status).to eq(204)
    end
  end
end
