require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  let(:valid_session) do
    { user_id: 12 }
  end

  let(:valid_attributes) do
    {
      name: "Squish Master",
      email: "squishy@gmail.com",
      password: "schmurda",
      password_confirmation: "schmurda",
      birthday: Time.now-40.years
    }
  end

  let(:user) { User.create! user_attributes }

  let(:valid_attributes) {
    @valid_attributes = {
		body: "Yo ho ho and a bottle of rum!",
    	user_id: user_id
    }
  }

  let(:invalid_attributes) {
    @invalid_attributes = {
    	body: "Yo ho ho and a bottle of rum!",
    	user_id: user_id	
    }
  }
  end

  let(:valid_session) { {user_id: user_id} }

  describe "GET index" do
  	it "assigns posts as @posts" do
  		post = Post.create! valid_attributes
  		get :index, valid_session
  		expect(assigns(:posts)).to eq([post])
  	end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :edit, { :id => post.to_param, :user_id => user.id }, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, { :id => post.to_param, :user_id => user.id }, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end
