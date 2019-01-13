require "application_system_test_case"

class PackagesTest < ApplicationSystemTestCase
  setup do
    @package = packages(:one)
  end

  test "visiting the index" do
    visit packages_url
    assert_selector "h1", text: "Packages"
  end

  test "creating a Package" do
    visit packages_url
    click_on "New Package"

    fill_in "Amount", with: @package.amount
    fill_in "Description", with: @package.description
    fill_in "Status", with: @package.status
    fill_in "Title", with: @package.title
    fill_in "Url1", with: @package.url1
    fill_in "Url2", with: @package.url2
    fill_in "Url3", with: @package.url3
    fill_in "Url4", with: @package.url4
    fill_in "Url5", with: @package.url5
    click_on "Create Package"

    assert_text "Package was successfully created"
    click_on "Back"
  end

  test "updating a Package" do
    visit packages_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @package.amount
    fill_in "Description", with: @package.description
    fill_in "Status", with: @package.status
    fill_in "Title", with: @package.title
    fill_in "Url1", with: @package.url1
    fill_in "Url2", with: @package.url2
    fill_in "Url3", with: @package.url3
    fill_in "Url4", with: @package.url4
    fill_in "Url5", with: @package.url5
    click_on "Update Package"

    assert_text "Package was successfully updated"
    click_on "Back"
  end

  test "destroying a Package" do
    visit packages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Package was successfully destroyed"
  end
end
