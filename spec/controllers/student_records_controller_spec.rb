require 'rails_helper'

RSpec.describe StudentRecordsController, type: :controller do
  include Devise::TestHelpers

  let!(:user) { FactoryGirl.create(:user, email: 'tom@tom.com', password: 'password', password_confirmation: 'password') }
  let!(:student) { FactoryGirl.create(:student, first_name: "Timmy", last_name: "McTimmyFace") }
  let!(:records) { FactoryGirl.build_list(:record, 26, student_id: student.id) }

  describe 'GET #index' do
    before do
      records.each { |r| r.save }
    end

    context 'for a logged in user' do
      before do
        sign_in user
        get :index, student_id: student.id
      end

      it 'responds with a 200 status' do
        expect(response.status).to eq(200)
      end

      it 'sends page 1 of records in response' do
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
        get :index, student_id: student.id, format: :json
        expect(response.status).to eq(401)
      end
    end
  end
end
