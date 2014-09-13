module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = user.image_url.nil? ? "https://secure.gravatar.com/avatar/#{gravatar_id}" : user.image_url
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
