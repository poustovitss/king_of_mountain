module ProfileHelper
  def profile_status
    return '<span class="badge unverified_profile" /
                   data-placement="top" /
                   data-toggle="tooltip" /
                   data-original-title="Your profile not verified! Confirm email!">
              <i class="fa fa-close"></i>
            </span>'.html_safe unless current_user.confirmed?
    '<span class="badge verified_profile" /
           data-placement="top" /
           data-toggle="tooltip" /
           data-original-title="Your profile verified!">
      <i class="fa fa-check"></i>
    </span>'.html_safe
  end

  def verify_account
    link_to 'Верифицировать аккаунт', user_confirmation_path(user: { email: current_user.email }),
            method: :post,
            class: 'btn btn-xs btn-danger' unless current_user.confirmed?
  end

  def money_withdraw
    '<a href="" class="btn btn-success">
      <i class="fa fa-rouble m-right-xs">  Вывести</i>
    </a>'.html_safe if current_user.confirmed?
  end
end
