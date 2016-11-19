require 'test_helper'

class TalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tale = tales(:one)
  end

  test "should get index" do
    get tales_url
    assert_response :success
  end

  test "should get new" do
    get new_tale_url
    assert_response :success
  end

  test "should create tale" do
    assert_difference('Tale.count') do
      post tales_url, params: { tale: { content: @tale.content } }
    end

    assert_redirected_to tale_url(Tale.last)
  end

  test "should show tale" do
    get tale_url(@tale)
    assert_response :success
  end

  test "should get edit" do
    get edit_tale_url(@tale)
    assert_response :success
  end

  test "should update tale" do
    patch tale_url(@tale), params: { tale: { content: @tale.content } }
    assert_redirected_to tale_url(@tale)
  end

  test "should destroy tale" do
    assert_difference('Tale.count', -1) do
      delete tale_url(@tale)
    end

    assert_redirected_to tales_url
  end
end
