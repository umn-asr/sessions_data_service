require "rails_helper"
require "json"

RSpec.describe "Get sessions" do
  before(:all) do
    get "/sessions.json"
    @sessions = JSON.parse(response.body)["sessions"]
  end

  describe "as json" do
    it "returns a non-empty collection" do
      expect(@sessions).not_to be_empty
    end

    it "returns a structure that contains sessions attributes" do
      compare_element_to_documentation(@sessions)
    end

    it "returns a structure of unique sessions" do
      expect(@sessions).to match(@sessions.to_set.to_a)
    end
  end
end
