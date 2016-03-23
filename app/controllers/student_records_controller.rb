class StudentRecordsController < ApplicationController
  before_filter :authenticate_user_from_token!

  # Enter the normal Devise authentication path,
  # using the token authenticated user if available

  before_filter :authenticate_user!
  before_action :get_records

  respond_to :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 25
    records = @records.paginate(:page => page, :per_page => per_page)
    render json: JSONAPI::Serializer.serialize(records, is_collection: true, meta: get_meta(records)), status: 200
  end

  private

  def get_records
    @records = Record.where(student_id: params[:student_id])
  end
end
