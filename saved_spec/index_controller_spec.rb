require 'spec_helper'

describe 'index_controller' do

  before(:all) do
    @link_in_db = Faker::Internet.url
    @url_in_db = Url.create(full_url: @link_in_db)
  end

  describe '/' do
    before(:all) do
      get '/'
    end

    it 'Has Home Page and does not redirect' do
      expect(last_response).to be_ok
    end

    it 'Is Bootly' do
      expect(last_response.body).to include('bootly')
    end
  end

  describe '/urls #url list' do
    before(:all) do
      get '/urls'
    end

    it 'Has Urls' do
      expect(last_response).to be_ok
      expect(last_request.path).to eq('/urls')
    end

    it 'Displays URLs' do
      expect(last_response.body).to include(@link_in_db)
    end
  end

  describe 'Post Yahoo URL' do
    before(:all) do
      @url_link_posted = Faker::Internet.url
      post '/urls', full_url: @url_link_posted
      follow_redirect!
    end

    it 'Displays URLs' do
      expect(last_response.body).to include(@url_link_posted)
    end
  end
end
