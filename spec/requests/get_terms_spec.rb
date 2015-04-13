require "rails_helper"
require "json"

RSpec.describe "Get terms" do
  describe "as json" do
    get "/terms/index.json"

    terms = JSON.parse(response.body)

    expect(terms).not_to be_empty
  end
end