require 'test_helper'

class WebcamPicturesControllerTest < ActionController::TestCase
  setup do
    @webcam_picture = webcam_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webcam_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webcam_picture" do
    assert_difference('WebcamPicture.count') do
      post :create, webcam_picture: { name: @webcam_picture.name, snapshot: @webcam_picture.snapshot }
    end

    assert_redirected_to webcam_picture_path(assigns(:webcam_picture))
  end

  test "should show webcam_picture" do
    get :show, id: @webcam_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @webcam_picture
    assert_response :success
  end

  test "should update webcam_picture" do
    put :update, id: @webcam_picture, webcam_picture: { name: @webcam_picture.name, snapshot: @webcam_picture.snapshot }
    assert_redirected_to webcam_picture_path(assigns(:webcam_picture))
  end

  test "should destroy webcam_picture" do
    assert_difference('WebcamPicture.count', -1) do
      delete :destroy, id: @webcam_picture
    end

    assert_redirected_to webcam_pictures_path
  end
end
