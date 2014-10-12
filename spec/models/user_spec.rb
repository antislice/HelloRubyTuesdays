require 'spec_helper'

describe User do

  before(:all) do
    User.destroy_all
  end
  
  let(:user) { FactoryGirl.create(:user) }
  
  describe "validation" do
    it "should have a valid factory" do
      user.should be_valid
    end
    
    context "#name" do
      it "should require a username" do
        user.name = nil
        user.should_not be_valid
      end
    end
    
    context "#email" do
      it "should not be valid without an email or uid" do
        user.email = nil
        user.uid = nil
        user.should_not be_valid
      end

      it "should be valid with an email and no uid" do
        user.uid = nil
        user.should be_valid
      end

      it "should be valid without an email and with a uid" do
        user.email = nil
        user.should be_valid
      end
    end
    
    context "#password" do
      it "should not be valid without password" do
        user.password = nil
        user.should_not be_valid
      end

      it "should not be valid without password confirmation and uid is nil" do
        user.password_confirmation = nil
        user.uid = nil
        user.should_not be_valid
      end

      it "should be valid without password confirmation and uid exists" do
        user.password_confirmation = nil
        user.should be_valid
      end

      it "should not be valid with a different confirmation" do 
        user.password = "barfoo"
        user.should_not be_valid
      end
      it "should need a password with at least 6 characters" do
        user.password = "foo"
        user.password_confirmation = "foo"
        user.should_not be_valid
      end
    end
  end

end
