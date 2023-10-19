require "rails_helper"
require "json"

RSpec.describe "Get institutions" do
  describe "as json" do
    before(:all) do
      get "/institutions.json"
      @institutions = JSON.parse(response.body)["institutions"]
    end

    it "returns a non-empty collection" do
      expect(@institutions).not_to be_empty
    end

    it "returns a structure that contains institution attributes" do
      compare_element_to_documentation(@institutions)
    end

    it "returns a structure of unique institutions" do
      expect(@institutions).to match(@institutions.to_set.to_a)
    end
  end
end
