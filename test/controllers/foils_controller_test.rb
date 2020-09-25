require 'test_helper'

class FoilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foil = foils(:one)
  end

  test "should get index" do
    get foils_url
    assert_response :success
  end

  test "should get new" do
    get new_foil_url
    assert_response :success
  end

  test "should create foil" do
    assert_difference('Foil.count') do
      post foils_url, params: { foil: { description: @foil.description, title: @foil.title } }
    end

    assert_redirected_to foil_url(Foil.last)
  end

  test "should show foil" do
    get foil_url(@foil)
    assert_response :success
  end

  test "should get edit" do
    get edit_foil_url(@foil)
    assert_response :success
  end

  test "should update foil" do
    patch foil_url(@foil), params: { foil: { description: @foil.description, title: @foil.title } }
    assert_redirected_to foil_url(@foil)
  end

  test "should destroy foil" do
    assert_difference('Foil.count', -1) do
      delete foil_url(@foil)
    end

    assert_redirected_to foils_url
  end
end
