require "rails_helper"
require "json"

RSpec.describe "Get terms" do
  describe "as json" do
    it "returns a non-empty collection" do
      get "/terms.json"

      terms = JSON.parse(response.body)

      expect(terms).not_to be_empty
    end
  end
end
