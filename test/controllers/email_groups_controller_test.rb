require "test_helper"

class EmailGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_group = email_groups(:one)
  end

  test "should get index" do
    get email_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_email_group_url
    assert_response :success
  end

  test "should create email_group" do
    assert_difference("EmailGroup.count") do
      post email_groups_url, params: { email_group: { group_email: @email_group.group_email, message_count: @email_group.message_count, name: @email_group.name } }
    end

    assert_redirected_to email_group_url(EmailGroup.last)
  end

  test "should show email_group" do
    get email_group_url(@email_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_group_url(@email_group)
    assert_response :success
  end

  test "should update email_group" do
    patch email_group_url(@email_group), params: { email_group: { group_email: @email_group.group_email, message_count: @email_group.message_count, name: @email_group.name } }
    assert_redirected_to email_group_url(@email_group)
  end

  test "should destroy email_group" do
    assert_difference("EmailGroup.count", -1) do
      delete email_group_url(@email_group)
    end

    assert_redirected_to email_groups_url
  end
end
