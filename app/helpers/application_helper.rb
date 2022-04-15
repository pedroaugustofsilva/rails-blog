# frozen_string_literal: true

module ApplicationHelper
  def show_header?(controller_name)
    show_headers_in = %w[articles categories]
    show_headers_in.include?(controller_name)
  end
end
