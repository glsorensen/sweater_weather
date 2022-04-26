require 'rails_helper'

RSpec.describe 'sessions request' do
    describe 'happy path' do
        before :each do
            params = { email: 'gls@gmail.com',
                password: 'password',
                password_confirmation: 'password'}
            post "/api/v1/users", params: params
            expect(User.count).to eq(1)
        end
        it 'will log a user in and post token' do
            post "/api/v1/sessions", params: {email: 'gls@gmail.com', password: 'password' }
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:data][:attributes]).to include(:email, :api_key)
        end
    end
    describe 'sad path' do
        it 'will return an error if the password is not correct' do
            post "/api/v1/sessions", params: {email: 'gls@gmail.com', password: 'wrong_password' }
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:error]).to eq('not found')
        end
    end
end
