# frozen_string_literal: true

module UsersHelper
  def photo_url(user)
    user.photo.representable? ? url_for(user.photo) : image_url('default_profile_picture.png')
  end
end
