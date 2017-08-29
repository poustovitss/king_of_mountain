module Users
  class RegistrationsController < Devise::RegistrationsController
    def new
      super
      session[:invited_by] = params[:invited_by]
    end
  end
end
