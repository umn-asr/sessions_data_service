require "rails_helper"

RSpec.describe HealthController, type: :request do
  describe "show" do
    it "returns ok when healthy" do
      allow(HealthCheck).to receive(:healthy?).and_return(true)

      get "/up"
      expect(response.status).to eq(200)
    end

    it "returns service_unavailable when not" do
      allow(HealthCheck).to receive(:healthy?).and_return(false)

      get "/up"
      expect(response.status).to eq(503)
    end
  end
end
