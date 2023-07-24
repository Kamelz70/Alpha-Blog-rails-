require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category=Category.new(name:"sports")
  end

  test "category should be valid" do
    @category.name="sports"
    assert @category.valid?
  end


  test "name should be present" do
    @category.name=""
    assert_not @category.valid?
  end
  test "name should be unique" do
    @category.name="sports"
    @category2=Category.new(name:"sports")
    @category.save
    assert_not @category2.valid?
  end
  test "name should be not too long" do
    @category.name="ssssssssssssssssssssssssssssssssssssssssssssssssss"
    assert_not @category.valid?
  end
  test "name should be not too short" do
    @category.name="s"
    assert_not @category.valid?
  end

end