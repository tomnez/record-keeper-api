require 'rails_helper'

RSpec.describe UserStudentsController, type: :controller do
  include Devise::TestHelpers

  let!(:user) { FactoryGirl.create(:user, email: 'tom@tom.com', password: 'password', password_confirmation: 'password') }
  let!(:students) { FactoryGirl.build_list(:student, 50) }

  describe 'GET #index' do
    before do
      user.students << students
    end

    context 'for a logged in user' do
      before do
        sign_in user
        get :index, user_id: user.id
      end

      it 'responds with a 200 status' do
        expect(response.status).to eq(200)
      end

      it 'sends page 1 of students in response' do
        parsed_body = JSON.parse(response.body)
        expect(parsed_body['data'].count).to eq(25)
      end

      it 'sends meta data in response' do
        parsed_body = JSON.parse(response.body)
        expect(parsed_body).to have_key('meta')
      end
    end

    context 'for a non logged-in user' do
      it 'responds with a 401' do
        get :index, user_id: user.id, format: :json
        expect(response.status).to eq(401)
      end
    end
  end
end
