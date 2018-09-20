require 'rails_helper'

describe "Websites API" do
  it 'sends a list of websites' do
    get '/api/v1/websites'
    json = JSON.parse(response.body)
    expect(response).to be_success
  end

   it 'creates a content for websites' do
    post '/api/v1/websites', params: { website: {url: "http://ruby.bastardsbook.com/files/hello-webpage.html"}, format: :json}
    json = JSON.parse(response.body)
    expect(response).to be_success
  end

end