 module ApplicationHelper
  # => <img alt="User Avatar" src="http://gravatar.com/avatar/..." />
  #
  # The argument passed to the gravatar_for method is the user object,
  # which is automatically passed the email attribute by default.
  #
  # The second argument is an options hash which is optional.
  # It accepts the following keys:
  #
  # size - The size of the image in pixels.
  # rating - The rating of the image.
  # Default: 'g'.
  #
  # Example:
  #
  #   gravatar_for(user, size: 80, rating: 'pg')
  #   # => <img alt="User Avatar" src="https://secure.gravatar.com/avatar/..." />

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end
end
