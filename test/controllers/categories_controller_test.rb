require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @admin_user=User.create(admin:true,username: "admin",email: "admin@example.com",password: "password")
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in_as(@admin_user)
    assert_difference("Category.count",1) do
      post categories_url, params: { category: {name: "travel"  } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should not create category if user isn't admin" do
    assert_no_difference("Category.count") do
      post categories_url, params: { category: {name: "travel"  } }
    end
    assert_redirected_to categories_url
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    sign_in_as(@admin_user)
    get edit_category_url(@category)
    assert_response :success
  end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference("Category.count", -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end
end
