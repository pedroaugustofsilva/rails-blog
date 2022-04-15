# frozen_string_literal: true

module NavbarHelper
  def active_nav_bar_class(category_name = nil)
    return 'font-semibold' if params[:category].blank? && category_name.nil?

    category_name.eql?(params[:category]) ? 'font-semibold' : ''
  end
end
