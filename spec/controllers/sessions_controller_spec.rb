require 'spec_helper'

describe SessionsController do
  describe "POST create" do
    before do
      @user = User.create!(username: 'test', password: 'testpass', password_confirmation: 'testpass', email: 'test@example.org')
    end

    it "redirects to sessions#new on a bad password" do
      post :create, session: {username: 'test', password: 'wrongpass'}
      expect(response).to redirect_to(new_session_path)
    end

    it "redirects to sessions#new on a bad username" do
      post :create, session: {username: 'doesnotexist', password: 'testpass'}
      expect(response).to redirect_to(new_session_path)
    end


    it "redirects to the home page on success" do
      post :create, session: {username: 'test', password: 'testpass'}
      expect(response).to redirect_to(root_path)
    end

    it "sets an error on failure" do
      post :create, session: {username: 'test', password: 'wrongpass'}
      expect(flash[:alert]).to match /bad/i
    end

    it "sets a success message on success" do
      post :create, session: {username: 'test', password: 'testpass'}
      expect(flash[:notice]).to match /success/i
    end

    it "sets the current user on success" do
      post :create, session: {username: 'test', password: 'testpass'}
      expect(session[:current_user]).to eq(@user)
    end

  end

  describe "GET destroy" do
    before do
      @user = User.create!(username: 'test', password: 'testpass', password_confirmation: 'testpass', email: 'test@example.org')
      post :create, session: {username: 'test', password: 'testpass'}
    end

    it "clears the current user from the session" do
      get :destroy
      expect(session[:current_user]).to be_nil
    end

    it "sets a flash notice" do
      get :destroy
      expect(flash[:notice]).to match /success/i
    end
  end
end
