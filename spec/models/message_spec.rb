require 'rails_helper'


RSpec.describe Message, type: :model do
  context "Create" do
    it "fails to create with no message text" do
      msg = Message.new(message: "")
      expect(msg.save).to eq false
      expect(msg.errors.full_messages).to include("Message can't be blank")
    end

    it "fails to create with message text too large" do
      msg = Message.new(message: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      expect(msg.save).to eq false
      expect(msg.errors.full_messages).to include("Message is too long (maximum is 150 characters)")
    end

    it "creates with message text just right" do
      msg_text = "Lorem ipsum dolor sit amet"
      msg = Message.new(message: msg_text)
      expect { msg.save }.to change { Message.count }.by(1)
      expect(Message.first.message).to eq msg_text
    end
  end

  context "Destroy" do
    it "deletes a message" do
      msg = Message.new(msg text: "Lorem ipsum dolor sit amet")
      msg.save
      expect { msg.destroy }.to change { Message.count }.by(-1)
    end
  end
end
