require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
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

  let(:user) { User.create! valid_attributes }

  let(:invalid_attributes) do
    { email: nil }
  end

  describe "GET index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

   describe "GET edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, { id: user.id }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, { id: user.id }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dog" do
      dog = Dog.create! valid_attributes
      delete :destroy, { id: dog.id }, valid_session
      expect(Dog.find_by_id(dog.id)).to be_nil
    end

    it "redirects to the dogs list" do
      dog = Dog.create! valid_attributes
      delete :destroy, { id: dog.id }, valid_session
      expect(response).to redirect_to(dogs_path)
    end
  end

  describe "POST create" do
    context "when valid attributes" do  
      it "creates the requested user" do
        post :create, { user: valid_attributes }, valid_session
        expect(User.find_by_email(valid_attributes[:email])).to be_present
      end

      it "assigns the requested user to @user" do
        post :create, { user: valid_attributes }, valid_session
        expect(assigns(:user)).to eq(User.find_by_email(valid_attributes[:email]))
      end

      it "redirects to specific user" do
        post :create, { user: valid_attributes }, valid_session
        expect(response).to redirect_to assigns(:user)
      end
    end

    context "when invalid attributes" do
      it "does not create requested user" do
        post :create, { user: invalid_attributes }, valid_session
        expect(Dog.find_by_email(valid_attributes[:email])).to be_nil
      end

      it "renders the new template" do
        post :create, { user: invalid_attributes }, valid_session
        expect(response).to render_template(:new)
      end
    end
  end

  # describe "PUT update" do
  #   context "when valid attributes" do
  #     it "update the requested user" do
  #       user = User.create! valid_attributes
  #       name = "user name"
  #       put :update, { id: user.id, user: { name: name } }, valid_session
  #       expect(User.find_by_email(user.email).name).to eq(name)
  #     end

  #     it "assigns the requested user to @user" do
  #       user = User.create! valid_attributes
  #       name = "user name"
  #       put :update, { id: user.id, user: { name: name } }, valid_session
  #       expect(assigns(:user)).to eq(User.find_by_email(user.email))
  #     end

  #     it "redirects to specific user" do
  #       user = User.create! valid_attributes
  #       name = "user name"
  #       put :update, { id: user.id, user: { name: name } }, valid_session
  #       expect(response).to redirect_to assigns(:user)
  #     end
  #   end

  #   context "when invalid attributes" do
  #     it "does not update requested user" do
  #       user = User.create! valid_attributes
  #       put :update, { id: user.id, user: { name: nil } }, valid_session
  #       expect(User.find_by_email(user.email).name).to be_present
  #     end

  #     it "renders the edit template" do
  #       user = User.create! valid_attributes
  #       put :update, { id: user.id, user: { name: nil } }, valid_session
  #       expect(response).to render_template(:edit)
  #     end
  #   end
  # end

  describe "GET destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      get :destroy, { id: user.id }, valid_session
      expect(User.find_by_id(user.id)).to be_nil
    end

    it "destroys the requested user" do
      user = User.create! valid_attributes
      get :destroy, { id: user.id }, valid_session
      expect(response).to redirect_to users_url
    end
  end

end
