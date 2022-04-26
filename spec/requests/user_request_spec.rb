# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'users request' do
  describe 'happy path' do
    it 'returns json' do
      expect(User.count).to eq(0)
      data = {
        "email": 'gls@gmail.com',
        "password": 'password',
        "password_confirmation": 'password'
      }
      post '/api/v1/users', params: data
      user = JSON.parse(response.body, symbolize_names: true)
      expect(User.count).to eq(1)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes]).to_not have_key(:password)
      expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
    end
  end

  describe 'sad path' do
    it 'will return an error if the password does not match' do
      params = { email: 'whatever@example.com',
                 password: 'password5',
                 password_confirmation: 'password' }

      post '/api/v1/users', params: params
      response_info = JSON.parse(response.body, symbolize_names: true)
      expect(response_info[:status]).to eq(400)
      expect(response_info[:error]).to eq('passwords do not match')
    end

    it 'will return an error if email is taken' do
      User.create!(email: 'whatever@example.com', password: 'password')
      params = { email: 'whatever@example.com',
                 password: 'password',
                 password_confirmation: 'password' }
      post '/api/v1/users', params: params
      response_info = JSON.parse(response.body, symbolize_names: true)
      expect(response_info[:status]).to eq(400)
      expect(response_info[:error]).to eq('email taken')
    end
  end
end
