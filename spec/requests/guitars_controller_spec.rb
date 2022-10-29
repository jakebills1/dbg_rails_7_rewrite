require 'rails_helper'

RSpec.describe "Guitar CRUD", :type => :request do 
  # before :all do 
  #   # auth 
  #   post '/api/auth/sign_in', :params => { :email => "test@test.com", :password =>  "password"}
  #   token = response.headers["access-token"]
  #   token_type = response.headers["token-type"]
  #   client = response.headers["client"]
  #   expiry = response.headers["expiry"]
  #   uid = response.headers["uid"]
  #   @headers = {
  #     "access-token" => "#{token}",
  #     "token-type" => "#{token_type}",
  #     "client" => "#{client}",
  #     "expiry" => "#{expiry}",
  #     "uid" => "#{uid}"
  #   }
  # end
  
  it 'renders all guitars on index' do 
    get '/api/guitars'
    expect(response.status).to eql(200)
    expect(JSON.parse(response.body).length).to be > 0
  end
  it 'creates a guitar' do
    post '/api/guitars', :params => { :guitar => { :name => "a name", :price => 2000, :description => "a description", :year => 2012}}#, :headers => @headers
    expect(response.status).to eql(200)
    expect(JSON.parse(response.body)["id"]).to be > 0
  end
  it 'updates a guitar' do 
    patch '/api/guitars/6', :params => { :guitar => { :name => "a new name"}}#, :headers => @headers
    expect(response.status).to eql(200)
    expect(JSON.parse(response.body)["name"]).to eql("a new name") 
  end
  it 'deletes a guitar' do 
    delete '/api/guitars/6'#, :headers => @headers
    expect(response.status).to eql(200)
    expect(JSON.parse(response.body)["message"]).to eql("deleted")  
  end
end
