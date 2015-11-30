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

  describe "GET new" do
  	it "assigns a new post as @post" do
  		get :new, valid_session
  		expect(assigns(:post)).to be_new(Post)
  	end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, { :id => post.to_param, :user_id => user.id }, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

    describe "POST create" do
      context "when creating a post" do
        it "creates the requested post as @post" do
          post :create, {post: valid_attributes}, valid_session
          expect(Post.find_by(user_id: valid_session[:user_id])).to be_present
        end

        it "assigns the requested post to @post" do
          post :create, {post: valid_attributes}, valid_session
          expect(assigns(:post)).to eq(Post.find_by(user_id: valid_session[:user_id]))
        end

        it "redirects to all posts" do
          post :create, {post: valid_attributes}, valid_session
          expect(response).to redirect_to(posts_path)
        end
      end

    context "user not signed in when trying to create new post" do
      it "redirects user to login path" do
		get :new, {}
		expect(response(:status)).to redirect_to(login_path)
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested post" do
        delete :destroy, { :id => post.to_param, :user_id => user.id }, valid_session
        expect(Post.find_by(user_id: valid_session[:user_id])).to eq(nil)
      end

      it "redirects to the posts list" do
      	post = Post.create! valid_attributes
        delete :destroy, { :id => post.to_param, :user_id => user.id }, valid_session
        expect(response).to redirect_to(user_posts_url)
      end
    end