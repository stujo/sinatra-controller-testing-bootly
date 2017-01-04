require 'spec_helper'
describe 'User Stories' do

  before(:all) do
    @link_in_db = Faker::Internet.url
    @url_in_db = Url.create(full_url: @link_in_db)
  end

  describe 'Home Page' do

    describe 'Click urls link' do
      before(:all) do
        visit '/'
        click_on('link_urls')
        @redirected_to = current_path
      end

      it 'Click on urls link on home page' do
        page.has_content?(@link_in_db)
        expect(current_path).to eq('/urls')
      end

    end

    describe 'Submit new url form' do
      before(:all) do
        @url_link_submitted = Faker::Internet.url
        visit '/'
        fill_in('full_url', :with => @url_link_submitted)
        click_on 'submit_add'
        @redirected_to = current_path
      end

      it 'should add new url' do
        page.has_content?(@url_link_submitted)
      end

      it 'should redirect to /urls' do
        expect(@redirected_to).to eq('/urls')
      end
    end
  end

  describe 'Urls Page' do
    describe 'Click home link' do
      before(:all) do
        visit '/urls'
        click_link('link_home')
        @redirected_to = current_path
      end

      it 'Should display home page' do
        expect(current_path).to eq('/')
      end

    end

  end
end
