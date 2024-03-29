module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    suppress(Exception){
      user.image_url = gravatar_url
      user.save
    }
    image_tag(gravatar_url, alt: 'Profile picture', class: 'ui huge avatar image')
  end
end
