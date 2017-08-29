class UsersController < ApplicationController
  include ProfileHelper

  layout 'devise_layout', only: :finish_signup
  before_action :set_user, only: [:finish_signup, :show, :update]
  before_action :check_user, only: [:edit, :update]

  def show

  end

  def edit

  end

  def update

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
    @user = User.find(params[:id])
  end

  def check_user
    redirect_to dashboard_path, notice: 'Вы можете редактировать только свой профиль' if current_user.id != params[:id].to_i
  end

  def user_params
    accessible = [ :name, :email ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
