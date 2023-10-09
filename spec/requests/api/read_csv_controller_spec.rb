require 'rails_helper'

RSpec.describe 'Shows API', type: :request do
  before do
    # Antes dos testes, você pode criar registros de exemplo no banco de dados
    @show1 = NetflixShow.create(title: 'Show 1', year: 2022)
    @show2 = NetflixShow.create(title: 'Show 2', year: 2021)
    @show3 = NetflixShow.create(title: 'Show 3', year: 2023)
  end

  describe 'GET /api/shows' do
    it 'retorna uma resposta HTTP bem-sucedida' do
      get '/api/shows'
      expect(response).to have_http_status(:ok)
    end

    it 'retorna registros no formato JSON' do
      get '/api/shows'
      expect(response.content_type).to include('application/json')
    end
  end
end
