require 'rails_helper'

RSpec.describe 'MoviesDb  API', type: :request do
  describe 'GET /api/v1/movies/search' do
    context 'with query' do
        before { get '/api/v1/movies/search?query=Gump' }

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    context 'with no query' do
        before { get '/api/v1/movies/search' }

        it 'returns status code 400' do
            expect(response).to have_http_status(400)
        end
    end
  end
end