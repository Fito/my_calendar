require 'spec_helper'

describe EventsController do
  let(:token) { 'some_token' }
  let(:event) { Event.create(title: 'some_event', date: Time.now) }
  let(:response_body) { JSON.parse(response.body) }

  before do
    user = User.create(token: token)
    user.events << event
  end

  describe '#index' do
    it 'returns the right events for the given token' do
      get :index, token: token
      response_body.first['title'].should == 'some_event'
      response_body.first['day'].should == Time.now.day
    end
  end

  describe '#create' do
    it 'creates events from the passed hash' do
      post :create, token: token, events: '[{"title":"new_event","day":"11","month":"11","year":"2011"}]'
      Event.last.title.should == "new_event"
    end
  end
end