# frozen_string_literal: true

module UsersHelper
  def photo_url
    @global_user.photo.representable? ? url_for(@global_user.photo) : image_url('default_profile_picture.png')
  end
end
