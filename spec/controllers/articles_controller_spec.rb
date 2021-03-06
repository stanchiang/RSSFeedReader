require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ArticlesController do

  # This should return the minimal set of attributes required to create a valid
  # Article. As you add validations to Article, be sure to
  # adjust the attributes here as well.
  #let(:channel) { FactoryGirl.create(:channel)}

  before(:each) do
     Channel.delete_all
  end

  let(:valid_attributes) { { "title" => "MyString" , "channel_id" => "1"} }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ArticlesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all articles as @articles" do
      #article = Article.create! valid_attributes
      article = FactoryGirl.create(:article)
      get :index, {:channel_id => article.channel_id}, valid_session
      assigns(:articles).should eq([article])
    end
  end

  describe "GET show" do
    it "assigns the requested article as @article" do
      # article = Article.create! valid_attributes
      article = FactoryGirl.create(:article)
      get :show, {:channel_id => article.channel_id, :id => article.to_param}, valid_session
      assigns(:article).should eq(article)
    end
  end

  describe "GET new" do
    it "assigns a new article as @article" do
      channel = FactoryGirl.create(:channel)
      get :new, {:channel_id => channel.id}, valid_session
      assigns(:article).should be_a_new(Article)
    end
  end

  describe "GET edit" do
    it "assigns the requested article as @article" do
      article = FactoryGirl.create(:article)
      get :edit, {:channel_id => article.channel_id, :id => article.to_param}, valid_session
      assigns(:article).should eq(article)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Article" do
        channel = FactoryGirl.create(:channel)
        expect {
          post :create, {:channel_id => channel.id, :article => valid_attributes}, valid_session
        }.to change(Article, :count).by(1)
      end

      it "assigns a newly created article as @article" do
        channel = FactoryGirl.create(:channel)
        post :create, {:channel_id => channel.id, :article => valid_attributes}, valid_session
        assigns(:article).should be_a(Article)
        assigns(:article).should be_persisted
      end

      it "redirects to channel artilces list" do
        channel = FactoryGirl.create(:channel)
        post :create, {:channel_id => channel.id, :article => valid_attributes}, valid_session
        response.should redirect_to(channel_path(channel.id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        # Trigger the behavior that occurs when invalid params are submitted
        channel = FactoryGirl.create(:channel)
        Article.any_instance.stub(:save).and_return(false)
        post :create, {:channel_id => channel.id, :article => { "title" => "invalid value" }}, valid_session
        assigns(:article).should be_a_new(Article)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        channel = FactoryGirl.create(:channel)
        Article.any_instance.stub(:save).and_return(false)
        post :create, {:channel_id => channel.id, :article => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested article" do
        article = FactoryGirl.create(:article)
        # Assuming there are no other articles in the database, this
        # specifies that the Article created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Article.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:channel_id => article.channel_id, :id => article.to_param, :article => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested article as @article" do
        article = FactoryGirl.create(:article)
        put :update, {:channel_id => article.channel_id, :id => article.to_param, :article => valid_attributes}, valid_session
        assigns(:article).should eq(article)
      end

      it "redirects to the channel articles" do
        article = FactoryGirl.create(:article)
        put :update, {:channel_id => article.channel_id, :id => article.to_param, :article => valid_attributes}, valid_session
        response.should redirect_to(channel_path(article.channel_id))
      end
    end

    describe "with invalid params" do
      it "assigns the article as @article" do
        article = FactoryGirl.create(:article)
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        put :update, {:channel_id => article.channel_id, :id => article.to_param, :article => { "title" => "invalid value" }}, valid_session
        assigns(:article).should eq(article)
      end

      it "re-renders the 'edit' template" do
        article = FactoryGirl.create(:article)
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        put :update, {:channel_id => article.channel_id, :id => article.to_param, :article => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested article" do
      article = FactoryGirl.create(:article)
      expect {
        delete :destroy, {:channel_id => article.channel_id, :id => article.to_param}, valid_session
      }.to change(Article, :count).by(-1)
    end

    it "redirects to the articles list" do
      article = FactoryGirl.create(:article)
      delete :destroy, {:channel_id => article.channel.id, :id => article.to_param}, valid_session
      response.should redirect_to(channel_path(article.channel_id))
    end
  end

end
