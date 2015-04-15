require "rails_helper"
require "json"

RSpec.describe "Get institutions" do
  describe "as json" do
    it "returns a non-empty collection" do
      get "/institutions.json"

      expect(JSON.parse(response.body)).not_to be_empty
    end

    it "returns a structure that contains institution attributes" do
      get "/institutions.json"

      compare_element_to_documentation(JSON.parse(response.body))
    end

    it "returns a structure of unique institutions" do
      get "/institutions.json"

      institutions = JSON.parse(response.body)
      expect(terms).to match(terms.to_set)
    end
  end
end
