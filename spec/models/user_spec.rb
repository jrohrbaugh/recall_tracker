require 'spec_helper'

describe User do
  describe "authenticate" do
    before do
      @user = User.create(username:"test", email:"test@example.org",
                          password:"testpass", password_confirmation:"testpass")
    end

    it "authenticates with the correct password" do
      expect(@user.authenticate("testpass")).to be_truthy
    end

    it "does not authenticate with an incorrect password" do
      expect(@user.authenticate("incorrectpass")).to be_falsy
    end
  end
end
