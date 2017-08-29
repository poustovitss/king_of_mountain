module ApplicationHelper
  def time_format(time)
    l time, format: :date_with_time if time
  end

  def referral_link_of_current_user
    "#{ENV['SITE_URL']}users/sign_up?invited_by=#{current_user.id}" # TODO
  end
end
