require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: "veigar", description: "veigar is a bronken champion")  
  end

  test "article should be valid" do
    assert @article.valid?
  end  

  test "name should be present" do
    @article.name = " "
    assert_not @article.valid?
  end

  test "description should be present" do
    @article.description = " "
    assert_not @article.valid?
  end

  test "description shouldn't be less than 5 characters" do
    @article.description = "a" * 3
    assert_not @article.valid?
  end
  test "description shouldn't be more than 500 characters" do
    @article.description = "a" * 501
    assert_not @article.valid?
  end
end