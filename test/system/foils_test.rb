require "application_system_test_case"

class FoilsTest < ApplicationSystemTestCase
  setup do
    @foil = foils(:one)
  end

  test "visiting the index" do
    visit foils_url
    assert_selector "h1", text: "Foils"
  end

  test "creating a Foil" do
    visit foils_url
    click_on "New Foil"

    fill_in "Description", with: @foil.description
    fill_in "Title", with: @foil.title
    click_on "Create Foil"

    assert_text "Foil was successfully created"
    click_on "Back"
  end

  test "updating a Foil" do
    visit foils_url
    click_on "Edit", match: :first

    fill_in "Description", with: @foil.description
    fill_in "Title", with: @foil.title
    click_on "Update Foil"

    assert_text "Foil was successfully updated"
    click_on "Back"
  end

  test "destroying a Foil" do
    visit foils_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Foil was successfully destroyed"
  end
end
