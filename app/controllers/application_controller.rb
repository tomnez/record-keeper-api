class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  helper_method :get_meta

  private

  def authenticate_user_from_token!
    authenticate_with_http_token do |token, options|
      user_email = options[:email].presence
      user = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end

  def get_meta(model)
    {
      total_pages: model.total_pages,
      page: model.current_page,
      per_page: model.per_page
    }
  end
end
