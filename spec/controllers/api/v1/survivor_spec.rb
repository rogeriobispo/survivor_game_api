require 'rails_helper'

RSpec.describe Api::V1::SurvivorController, type: :request do
  describe 'POST #survivor' do
    it 'returns http sucess' do
      survivor_post
      expect(response).to have_http_status(:success)
    end

    it 'return http fail (missing params)' do
      post '/api/v1/survivor', params: { survivor: { name: 'empty' } }
      expect(response).to have_http_status(422)
    end
  end
end

def survivor_post
  post '/api/v1/survivor', params: { survivor:
                                      { name: 'Rogeiro bispo',
                                        age: 34, gender: 'M',
                                        last_latitude: '23',
                                        last_longitude: '-46' } }
end
