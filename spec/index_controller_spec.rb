require 'spec_helper'

describe 'IndexController' do

  describe 'home page' do
    it 'should be ok' do
      get '/'
      expect(last_response).to be_ok # is a 200
    end

    it 'should have link to urls page' do
      get '/'
      expect(last_response.body).to have_tag 'a', :with => {:href => '/urls'}
    end

  end

  describe 'missing page' do
    it 'should not be ok' do
      get '/asdsad'
      expect(last_response.status).to eq 404
    end
  end

  describe 'old page /teams' do
    it 'should redirect' do
      get '/teams'
      expect(last_response.status).to be_between(301,302)
    end

    it 'should redirect to /about' do
      get '/teams'
      expect(last_response.location).to end_with'/about'
    end
  end



end
