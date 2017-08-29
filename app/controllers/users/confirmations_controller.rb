module Users
  class ConfirmationsController < Devise::ConfirmationsController

    protected

    def after_confirmation_path_for(resource_name, resource)
      dashboard_path
    end

    def after_resending_confirmation_instructions_path_for(resource_name)
      edit_user_path(current_user)
    end
  end
end
