require "rails_helper"
require "json"

RSpec.describe "Get academic careers" do
  describe "as json" do
    before(:all) do
      get "/academic_careers.json"
      @academic_careers = JSON.parse(response.body)["academic_careers"]
    end

    it "returns a non-empty collection" do
      expect(@academic_careers).not_to be_empty
    end

    it "returns a structure that contains academic careers attributes" do
      compare_element_to_documentation(@academic_careers)
    end

    it "returns a structure of unique academic_careers" do
      expect(@academic_careers).to match(@academic_careers.to_set.to_a)
    end
  end
end
