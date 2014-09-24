class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

  has_many :links
  
  validates :name, presence: true
  validates :email, presence: true, if: "uid.nil?"
  validates :uid, presence: true, if: "email.nil?"

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email = auth.info.email # okay to be blank for github?
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image_url = auth.info.image

      # auth.info = nickname, email, name, image (github av, or auth.extra.raw_info.gravatar_id)
      # auth.info.urls = github, blog (twitter for me)
      # auth.extra.raw_info has a bunch of stuff
    end
  end

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def email_required?
    # don't require email if uid exists, it means we authenticated a different way
    true unless uid.nil?
    false
  end
  
end
