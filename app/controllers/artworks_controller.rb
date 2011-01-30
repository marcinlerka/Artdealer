class ArtworksController < ApplicationController
  before_filter :authenticate_user!
  load_resource :user
  load_and_authorize_resource :artwork, :through => :user


  def index
    @artworks = User.find(params[:user_id]).artworks
  end

  def show
    @artwork = User.find(params[:user_id]).artworks.find(params[:id])
  end


  def new
    @artwork = User.find(params[:user_id]).artworks.build
  end


  def edit
    @artwork = User.find(params[:user_id]).artworks.find(params[:id])
  end


  def create
    @artwork = User.find(params[:user_id]).artworks.build(params[:artwork])

      if @artwork.save
        redirect_to([@artwork.user, @artwork], :notice => 'Artwork was successfully created.')
      else
        render :action => "new"
      end
  end


  def update
    @artwork = User.find(params[:user_id]).artworks.find(params[:id])

      if @artwork.update_attributes(params[:artwork])
        redirect_to([@artwork.user, @artwork], :notice => 'Artwork was successfully updated.')
      else
        render :action => "edit"
      end
  end


  def destroy
    user = User.find(params[:user_id])
    @artwork = user.artworks.find(params[:id])
    @artwork.destroy

    redirect_to user_artworks_url(user)
  end
end
