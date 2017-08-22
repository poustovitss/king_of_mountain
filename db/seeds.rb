User.where(email: 'admin@admin.com').first_or_create do |user|
  user.name                  = 'Admin'
  user.admin                 = true
  user.email                 = 'admin@admin.com'
  user.password              = 'changemeadmin'
  user.password_confirmation = 'changemeadmin'
end
