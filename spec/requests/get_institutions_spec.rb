require "rails_helper"
require "json"

RSpec.describe "Get institutions" do
  describe "as json" do
    it "returns a non-empty collection" do
      get "/institutions.json"

      institutions = JSON.parse(response.body)["institutions"]
      expect(institutions).not_to be_empty
    end

    it "returns a structure that contains institution attributes" do
      get "/institutions.json"

      institutions = JSON.parse(response.body)["institutions"]
      compare_element_to_documentation(institutions)
    end

    it "returns a structure of unique institutions" do
      get "/institutions.json"

      institutions = JSON.parse(response.body)["institutions"]
      expect(institutions).to match(institutions.to_set)
    end
  end
end
