require 'test_helper'

class PackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package = packages(:one)
  end

  test "should get index" do
    get packages_url
    assert_response :success
  end

  test "should get new" do
    get new_package_url
    assert_response :success
  end

  test "should create package" do
    assert_difference('Package.count') do
      post packages_url, params: { package: { amount: @package.amount, description: @package.description, status: @package.status, title: @package.title, url1: @package.url1, url2: @package.url2, url3: @package.url3, url4: @package.url4, url5: @package.url5 } }
    end

    assert_redirected_to package_url(Package.last)
  end

  test "should show package" do
    get package_url(@package)
    assert_response :success
  end

  test "should get edit" do
    get edit_package_url(@package)
    assert_response :success
  end

  test "should update package" do
    patch package_url(@package), params: { package: { amount: @package.amount, description: @package.description, status: @package.status, title: @package.title, url1: @package.url1, url2: @package.url2, url3: @package.url3, url4: @package.url4, url5: @package.url5 } }
    assert_redirected_to package_url(@package)
  end

  test "should destroy package" do
    assert_difference('Package.count', -1) do
      delete package_url(@package)
    end

    assert_redirected_to packages_url
  end
end
