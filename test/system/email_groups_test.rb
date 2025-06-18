require "application_system_test_case"

class EmailGroupsTest < ApplicationSystemTestCase
  setup do
    @email_group = email_groups(:one)
  end

  test "visiting the index" do
    visit email_groups_url
    assert_selector "h1", text: "Email groups"
  end

  test "should create email group" do
    visit email_groups_url
    click_on "New email group"

    fill_in "Group email", with: @email_group.group_email
    fill_in "Message count", with: @email_group.message_count
    fill_in "Name", with: @email_group.name
    click_on "Create Email group"

    assert_text "Email group was successfully created"
    click_on "Back"
  end

  test "should update Email group" do
    visit email_group_url(@email_group)
    click_on "Edit this email group", match: :first

    fill_in "Group email", with: @email_group.group_email
    fill_in "Message count", with: @email_group.message_count
    fill_in "Name", with: @email_group.name
    click_on "Update Email group"

    assert_text "Email group was successfully updated"
    click_on "Back"
  end

  test "should destroy Email group" do
    visit email_group_url(@email_group)
    click_on "Destroy this email group", match: :first

    assert_text "Email group was successfully destroyed"
  end
end
