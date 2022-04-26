# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'forecast request' do
  it 'returns json' do
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    get '/api/v1/pictures', headers: headers, params: { location: 'denver,co' }
    background = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(background).to have_key(:data)
    expect(background[:data]).to have_key(:id)
    expect(background[:data]).to have_key(:type)
    expect(background[:data]).to have_key(:attributes)
    expect(background[:data][:attributes]).to have_key(:image)
    expect(background[:data][:attributes]).to have_key(:credit)
    expect(background[:data][:attributes][:image]).to have_key(:location)
    expect(background[:data][:attributes][:image]).to have_key(:image_url)
    expect(background[:data][:attributes][:credit]).to have_key(:source)
    expect(background[:data][:attributes][:credit]).to have_key(:author)
    expect(background[:data][:attributes][:credit]).to have_key(:logo)

    expect(background[:data][:attributes]).to_not have_key(:width)
    expect(background[:data][:attributes]).to_not have_key(:height)
  end
end
