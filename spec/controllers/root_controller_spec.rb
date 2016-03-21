require 'rails_helper'
require 'mock_redis'

RSpec.describe RootController, type: :controller do
  before do
    $redis.set('record-keeper-client:index:current', '123')
    $redis.set('record-keeper-client:index:123', '<html><body></body></html>')
  end

  describe 'GET #index' do
    context 'for all users' do
      it 'renders the current index template set in redis' do
        get :index
        expect(response.status).to eq(200)
        expect(response.body).to eq('<html><body></body></html>')
        expect(response.content_type).to include('text/html')
      end
    end
  end
end
