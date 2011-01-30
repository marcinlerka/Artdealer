require 'test_helper'

class ArtworksControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @artwork = artworks(:one)
  end

  test "should get index" do
    get :index, :user_id => @user
    assert_response :success
    assert_not_nil assigns(:artworks)
  end

  test "should get new" do
    get :new, :user_id => @user
    assert_response :success
  end

  test "should create artwork" do
    assert_difference('Artwork.count') do
      post :create, :user_id => @user, :artwork => @artwork.attributes
    end

    assert_redirected_to user_artwork_path(@user, assigns(:artwork))
  end

  test "should show artwork" do
    get :show, :user_id => @user, :id => @artwork.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :user_id => @user, :id => @artwork.to_param
    assert_response :success
  end

  test "should update artwork" do
    put :update, :user_id => @user, :id => @artwork.to_param, :artwork => @artwork.attributes
    assert_redirected_to user_artwork_path(@user, assigns(:artwork))
  end

  test "should destroy artwork" do
    assert_difference('Artwork.count', -1) do
      delete :destroy, :user_id => @user, :id => @artwork.to_param
    end

    assert_redirected_to user_artworks_path(@user)
  end
end
