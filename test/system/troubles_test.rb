require "application_system_test_case"

class TroublesTest < ApplicationSystemTestCase
  setup do
    @trouble = troubles(:one)
  end

  test "visiting the index" do
    visit troubles_url
    assert_selector "h1", text: "Troubles"
  end

  test "should create trouble" do
    visit troubles_url
    click_on "New trouble"

    check "Display in navbar" if @trouble.display_in_navbar
    fill_in "Name", with: @trouble.name
    click_on "Create Trouble"

    assert_text "Trouble was successfully created"
    click_on "Back"
  end

  test "should update Trouble" do
    visit trouble_url(@trouble)
    click_on "Edit this trouble", match: :first

    check "Display in navbar" if @trouble.display_in_navbar
    fill_in "Name", with: @trouble.name
    click_on "Update Trouble"

    assert_text "Trouble was successfully updated"
    click_on "Back"
  end

  test "should destroy Trouble" do
    visit trouble_url(@trouble)
    click_on "Destroy this trouble", match: :first

    assert_text "Trouble was successfully destroyed"
  end
end
