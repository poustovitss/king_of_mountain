class UsersController < ApplicationController
  include ProfileHelper
  respond_to :html

  layout 'devise_layout', only: :finish_signup
  before_action :set_user, only: [:finish_signup, :show, :edit, :profile]
  before_action :check_user, only: [:edit, :update, :profile]

  def show; end

  def profile; end

  def edit; end

  def update
    if current_user.update(user_params)
      bypass_sign_in current_user
      redirect_to profile_user_path, notice: 'Ваш профиль был успешно обновлён.'
    else
      redirect_back(fallback_location: root_path, alert: current_user.errors.full_messages.join(" ").html_safe)
    end
  end

  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, bypass: true)
        redirect_to dashboard_path, notice: 'Ваш профиль был успешно создан.'
      else
        @show_errors = true
      end
    end
  end

  private

  def set_user
    @user ||= User.find(params[:id])
  end

  def check_user
    redirect_to dashboard_path, notice: 'Вы можете редактировать только свой профиль' if current_user.id != params[:id].to_i
  end

  def user_params
    accessible = [ :name, :email, :avatar, :sex, :country, :phone, :skype,
                   :vk_link, :fb_link, :tw_link ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
