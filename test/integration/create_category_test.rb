require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user=User.create(admin:true,username: "admin",email: "admin@example.com",password: "password")
    sign_in_as(@admin_user)
  end
  test "get new category form and create one" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category:{name: "food"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "food", response.body
  end

  test "get new category form and reject invalid submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count', 1 do
      post categories_path, params: { category:{name: " "}}
    end
    assert_match "Following Errors", response.body
    assert_select 'ul'
    assert_select 'li'
  end
end
