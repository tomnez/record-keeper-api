class UserStudentsController < ApplicationController
  before_filter :authenticate_user_from_token!

  # Enter the normal Devise authentication path,
  # using the token authenticated user if available

  before_filter :authenticate_user!

  before_action :get_user

  respond_to :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 25
    students = @user.students.paginate(:page => page, :per_page => per_page)
    render json: JSONAPI::Serializer.serialize(students, is_collection: true, meta: get_meta(students)), status: 200
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end
end
