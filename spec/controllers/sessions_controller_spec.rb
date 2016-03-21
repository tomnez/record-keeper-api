require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  include Devise::TestHelpers

  let!(:user) { FactoryGirl.create(:user, email: 'tom@tom.com', password: 'password', password_confirmation: 'password') }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    it 'responds with session data and a 201 status' do
      post :create, user: { email: 'tom@tom.com', password: 'password' }

      parsed_body = JSON.parse(response.body)
      full_record = parsed_body['record']['data']

      expect(response.status).to eq(201)

      expect(parsed_body).to have_key('token')
      expect(parsed_body).to have_key('email')
      expect(parsed_body).to have_key('admin')
      expect(parsed_body).to have_key('record')

      expect(full_record['type']).to eq('user')
      expect(full_record['id']).to eq(user.id)
      expect(full_record['attributes']['email']).to eq(user.email)
    end
  end
end
