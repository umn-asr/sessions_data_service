require "rails_helper"
require "json"

RSpec.describe "Get sessions" do
  describe "as json" do
    it "returns a non-empty collection" do
      get "/sessions.json"

      sessions = JSON.parse(response.body)

      expect(sessions).not_to be_empty
    end

    it "returns a structure that contains sessions attributes" do
      get "/sessions.json"

      compare_element_to_documentation(JSON.parse(response.body))
    end

    it "returns a structure of unique sessions" do
      get "/sessions.json"

      sessions = JSON.parse(response.body)
      expect(sessions).to match(sessions.to_set)
    end
  end
end
