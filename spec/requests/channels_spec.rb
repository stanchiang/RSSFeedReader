require 'spec_helper'

describe "Channels" do
  describe "GET /channels" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get channels_path
      response.status.should be(302)
    end
  end
end
