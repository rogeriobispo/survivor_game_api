require 'rails_helper'

RSpec.describe Api::V1::SurvivorsController, type: :request do
  describe 'POST #survivor' do
    it 'returns http sucess (criates a survivor)' do
      survivor_post
      expect(response).to have_http_status(:success)
    end

    it 'return http fail (missing fields)' do
      post '/api/v1/survivors', params: { survivor: { name: 'empty' } }
      expect(response).to have_http_status(422)
    end
  end

  describe 'PATCH/PUT #survivor update location' do
    it 'returns http sucess' do
      survivor = FactoryBot.create(:survivor)
      patch "/api/v1/survivors/#{survivor.id}",
            params: { survivor: { last_longitude: 90,
                                  last_latitude: 80 } }
      expect(response).to have_http_status(:success)
    end

    it 'return http fail (missing field)' do
      survivor = FactoryBot.create(:survivor)
      patch "/api/v1/survivors/#{survivor.id}",
            params: { survivor: { last_longitude: nil } }
      expect(response).to have_http_status(422)
    end

    it 'return http fail (not permited field)' do
      survivor = FactoryBot.create(:survivor)
      patch "/api/v1/survivors/#{survivor.id}",
            params: { survivor: { name: 'Rogerio Bispo' } }
      expect(response).to have_http_status(422)
    end
  end

  describe 'GET #Infected' do
    it 'return http success (Add a point of infection to related survivor)' do
      survivor = FactoryBot.create(:survivor)
      get "/api/v1/survivors/#{survivor.id}/infected"
      expect(response).to have_http_status(:success)
    end

    it 'return http faill (not found survivor)' do
      get '/api/v1/survivors/1/infected'
      expect(response).to have_http_status(422)
    end
  end
end

def survivor_post
  post '/api/v1/survivors', params: { survivor:
                                      { name: 'Rogeiro bispo',
                                        age: 34, gender: 'M',
                                        last_latitude: '23',
                                        last_longitude: '-46' } }
end
