module ArtworksHelper

  def show_artwork_link(object, content)
    link_to(content, [object.user, object]) if can?(:read, object)
  end

  def edit_artwork_link(object, content)
    link_to(content, edit_user_artwork_path( object.user, object)) if can?(:update, object)
  end

  def destroy_artwork_link(object, content)
    link_to(content, [object.user, object], :method => :delete, :confirm => "Are you sure?") if can?(:destroy, object)
  end

  def create_artwork_link(object, content)
    if can?(:create, object)
      link_to(content, new_user_artwork_path(params[:user_id]))
    end
  end

  def index_artwork_link(object, content)
    link_to(content, user_artworks_path(object.user)) if can?(:read, object)
  end
end
