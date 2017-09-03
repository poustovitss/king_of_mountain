class User < ApplicationRecord
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  enum sex: { male: 1, female: 2 }

  has_attached_file :avatar, default_url: '/images/img.jpg'
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 2.megabytes
  validates_with AttachmentContentTypeValidator, attributes: :avatar,
                 content_type: ['image/jpg', 'image/jpeg', 'image/png']

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update
  validates :name, presence: true, length: { minimum: 2, maximum: 32 }

  after_create :set_proviant

  def set_proviant
    self.provision = false unless invited_by.nil?
  end

  def invited_users
    User.where(invited_by: id)
  end

  def referal
    User.find(invited_by)
  end

  def facebook_link
    Identity.find_by_user_id(id).try(:link)
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    if user.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email

      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
