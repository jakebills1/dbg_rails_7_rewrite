require 'rails_helper'

RSpec.describe "Guitar CRUD", :type => :request do 
  let(:headers) do
    {}
  end
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
  context 'if the request is requesting JSON' do
    let(:headers) do
      { "ACCEPT" => "application/json" }
    end
    it 'renders all guitars on index' do 
      get '/guitars', :headers => headers
      expect(response.status).to eql(200)
      expect(JSON.parse(response.body).length).to be > 0
    end
    it 'creates a guitar' do
      post '/guitars', :params => { :guitar => { :name => "a name", :price => 2000, :description => "a description", :year => 2012}}, :headers => headers
      expect(response.status).to eql(200)
      expect(JSON.parse(response.body)["id"]).to be > 0
    end
    it 'updates a guitar' do 
      patch '/guitars/6', :params => { :guitar => { :name => "a new name"}}, :headers => headers
      expect(response.status).to eql(200)
      expect(JSON.parse(response.body)["name"]).to eql("a new name") 
    end
    it 'deletes a guitar' do 
      delete '/guitars/6', :headers => headers
      expect(response.status).to eql(200)
      expect(JSON.parse(response.body)["message"]).to eql("deleted")  
    end
  end
  context 'if the request is for html' do
    let(:guitar_id) { Guitar.last.id }
    it 'renders all guitars on index' do 
      get '/guitars', :headers => headers
      expect(response.status).to eql(200)
      expect(response.body.include? Guitar.first.name).to be_truthy
    end
    context 'creating a guitar successfully' do
      subject { post '/guitars', :params => { :guitar => { :name => "a name", :price => 2000, :description => "a description", :year => 2012}}, :headers => headers }
      it 'creates a guitar' do
        expect(subject).to redirect_to guitar_url(Guitar.last)
      end
    end
    context 'updating a guitar successfully' do  
      subject { patch "/guitars/#{guitar_id}", :params => { :guitar => { :name => "a new name"}}, :headers => headers }
      it 'updates a guitar' do 
        expect(subject).to redirect_to guitar_url(Guitar.find(guitar_id))
      end
    end
    context 'deleting a guitar succesfully' do
      subject { delete "/guitars/#{guitar_id}", :headers => headers }
      it 'deletes a guitar' do 
        expect(subject).to redirect_to guitars_url
      end
    end
  end
end
