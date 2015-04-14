require "rails_helper"
require "json"

RSpec.describe "Get terms" do
  describe "as json" do
    it "returns a non-empty collection" do
      get "/terms.json"

      terms = JSON.parse(response.body)

      expect(terms).not_to be_empty
    end

    it "returns a structure that contains term attributes" do
      get "/terms.json"

      compare_element_to_documentation(JSON.parse(response.body))
    end
  end
end
