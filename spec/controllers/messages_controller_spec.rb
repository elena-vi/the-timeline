require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe "GET index" do
    it "set's @messages" do
      msg = Message.create
      get :index
      expect(assigns(:messages)).to eq([msg])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST create" do
    it "creates a message and redirects to the timeline" do

      post "create", message: {message: "My message"}

      expect(response).to render_template(:index)

      expect(response.body).to include("Message was successfully created.")
    end

  end
end
