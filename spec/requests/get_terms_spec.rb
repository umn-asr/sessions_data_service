require "rails_helper"
require "json"

RSpec.describe "Get terms" do
  describe "as json" do
    it "returns a non-empty collection" do
      get "/terms.json"

      terms = JSON.parse(response.body)["terms"]
      expect(terms).not_to be_empty
    end

    it "returns a structure that contains term attributes" do
      get "/terms.json"

      terms = JSON.parse(response.body)["terms"]
      compare_element_to_documentation(terms)
    end

    it "returns a structure of unique terms" do
      get "/terms.json"

      terms = JSON.parse(response.body)["terms"]
      expect(terms).to match(terms.to_set)
    end
  end
end
