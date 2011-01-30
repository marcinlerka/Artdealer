module ApplicationHelper

  def show_user_link(object, content)
    link_to(content, object) if can?(:read, object)
  end

end
