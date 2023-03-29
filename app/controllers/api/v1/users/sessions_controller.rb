class Api::V1::Users::SessionsController < Devise::SessionsController
    # before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
      end
    respond_to :json
end
