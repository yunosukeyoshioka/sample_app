require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest



# test "login with invalid information" do
#     get login_path
#     assert_template 'sessions/new'
#     post login_path, params: { session: { email: "", password: "" } }
#     assert_template 'sessions/new'
#     assert_not flash.empty?
#     get root_path
#     assert flash.empty?
#   end
  # test "invalid signup information" do
  #   get signup_path
  #   assert_no_difference 'User.count' do
  #     post users_path, params: { user: { name:  "",
  #                                        email: "user@invalid",
  #                                        password:              "foo",
  #                                        password_confirmation: "bar" } }
  #   end
  #   assert_template 'users/new'
  #   assert_select 'div#<CSS id for error explanation>'
  #   assert_select 'div.<CSS class for field with error>'

    test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
    
  end
end
