require "rails_helper"
require "json"

RSpec.describe "Get terms" do
  describe "as json" do
    before(:all) do
      get "/terms.json"

      @terms = JSON.parse(response.body)["terms"]
    end

    it "returns a non-empty collection" do
      expect(@terms).not_to be_empty
    end

    it "returns a structure that contains term attributes" do
      compare_element_to_documentation(@terms)
    end

    it "returns a structure of unique terms" do
      expect(@terms).to match(@terms.to_set.to_a)
    end
  end
end
