require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    @category=Category.create(name:"sports")
    @category2=Category.create(name:"travel")
  end

  test "get all categories in index" do
    get "/categories"
    assert_match @category.name, response.body
    assert_match @category2.name, response.body
   # assert_match "a[href=?]", category_path(@category), text:@category.name

  end

end
