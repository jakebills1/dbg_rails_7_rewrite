require 'rails_helper'

RSpec.describe "Guitar CRUD", :type => :request do 
  let(:headers) do
    _headers = {}
    user = 'dbg_admin'
    pw = 'password' # TODO store in env
    _headers['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
    _headers
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
    let(:json_headers) do
      headers["ACCEPT"] = "application/json"
      headers
    end
    it 'renders all guitars on index' do 
      get '/admin/guitars', :headers => json_headers
      expect(response.status).to eql(200)
      expect(JSON.parse(response.body).length).to be > 0
    end
    it 'creates a guitar' do
      post '/admin/guitars', :params => { :guitar => { :name => "a name", :price => 2000, :description => "a description", :year => 2012}}, :headers => json_headers
      expect(response.status).to eql(200)
      expect(JSON.parse(response.body)["id"]).to be > 0
    end
    it 'updates a guitar' do 
      patch '/admin/guitars/6', :params => { :guitar => { :name => "a new name"}}, :headers => json_headers
      expect(response.status).to eql(200)
      expect(JSON.parse(response.body)["name"]).to eql("a new name") 
    end
    it 'deletes a guitar' do 
      delete '/admin/guitars/6', :headers => json_headers
      expect(response.status).to eql(200)
      expect(JSON.parse(response.body)["message"]).to eql("deleted")  
    end
  end
  context 'if the request is for html' do
    let(:guitar_id) { Guitar.last.id }
    it 'renders all guitars on index' do 
      get '/admin/guitars', :headers => headers
      expect(response.status).to eql(200)
      expect(response.body.include? Guitar.first.name).to be_truthy
    end
    context 'creating a guitar successfully' do
      subject { post '/admin/guitars', :params => { :guitar => { :name => "a name", :price => 2000, :description => "a description", :year => 2012}}, :headers => headers }
      it 'creates a guitar' do
        expect(subject).to redirect_to admin_guitar_url(Guitar.last)
      end
    end
    context 'updating a guitar successfully' do  
      subject { patch "/admin/guitars/#{guitar_id}", :params => { :guitar => { :name => "a new name"}}, :headers => headers }
      it 'updates a guitar' do 
        expect(subject).to redirect_to admin_guitar_url(Guitar.find(guitar_id))
      end
    end
    context 'deleting a guitar succesfully' do
      subject { delete "/admin/guitars/#{guitar_id}", :headers => headers }
      it 'deletes a guitar' do 
        expect(subject).to redirect_to admin_guitars_url
      end
    end
  end
end
