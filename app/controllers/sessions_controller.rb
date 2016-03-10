class SessionsController < Devise::SessionsController
  respond_to :html, :json

  def create
    super do |user|
      if request.format.json?
        data = {
          id: user.id,
          token: user.authentication_token,
          email: user.email,
          admin: user.admin
        }
        render json: data, status: 201 and return
      end
    end
  end
end
