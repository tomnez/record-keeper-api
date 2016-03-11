class UserStudentsController < ApplicationController
  before_filter :authenticate_user_from_token!

  # Enter the normal Devise authentication path,
  # using the token authenticated user if available

  before_filter :authenticate_user!

  before_action :get_user

  respond_to :json

  def index
    students = @user.students
    render json: JSONAPI::Serializer.serialize(students, is_collection: true), status: 200
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end
end
