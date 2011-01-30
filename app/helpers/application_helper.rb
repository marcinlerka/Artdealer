module ApplicationHelper

  def show_user_link(object, content)
    link_to(content, object) if can?(:read, object)
  end

  def users_link(object, content)
    link_to(content, users_path) if can?(:read, object)
  end
end
