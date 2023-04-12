require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.new(username: "pedro", email: "pedro@example.com")
        test "should be valid" do
            assert @user.valid?
        end
        test "name should be present" do
            @user.chefname = " "
            assert_not @user.valid?
        end
        test "name should be less than 30 characters" do
            @user.chefname = "a" * 31
            assert_not @user.valid?
        end
        test "email should be present" do
            @user.email = " "
            assert_not @user.valid?
        end
        test "email should not be too long" do
            @user.email = "a" * 245 + "@example.com"
            assert_not @user.valid?
        end
        test "email should accept correct format" do
            valid_emails = %w[user@example.com pedro22ahferreira@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
            valid_emails.each do |valids|
              @user.email = valids
              assert @user.valid?, "#{valids.inspect} should be valid"
            end
        end
        test "should reject invalid addresses" do
            invalid_emails = %w[pedro@example pedro@example,com pedro.name@gmail. joe@bar+foo.com]
            invalid_emails.each do |invalids|
              @user.email = invalids
              assert_not @user.valid?, "#{invalids.inspect} should be invalid"
            end
        end 
        test "email should be unique and case insensitive" do
            duplicate_chef = @user.dup
            duplicate_chef.email = @user.email.upcase
            @user.save
            assert_not duplicate_chef.valid?
        end
          
    end
    test "email should be lower case before hitting db" do
        mixed_email = "JohN@ExampLe.com"
        @user.email = mixed_email
        @user.save
        assert_equal mixed_email.downcase, @user.reload.email 
      end
end
