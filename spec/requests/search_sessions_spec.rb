require "rails_helper"
require 'json'

RSpec.describe "search sessions" do

  describe "by institution" do
    it "returns only sessions that match the institution" do
      get "/sessions.json?q=institution_id=UMNTC"
      sessions = JSON.parse(response.body)

      expect(sessions).not_to be_empty

      sessions.each do |session|
        expect(session["institution"]["institution_id"]).to eq("UMNTC")
      end
    end

    it "returns only sessions that match either institution" do
      #You have to encode | as %7C or else Rspec will error
      get "/sessions.json?q=institution_id=UMNTC%7CUMNMO"

      sessions = JSON.parse(response.body)

      expect(sessions).not_to be_empty

      sessions.each do |session|
        expect(session["institution"]["institution_id"]).to satisfy { |id| %w(UMNTC UMNMO).include?(id) }
      end
    end
  end

  describe "by term" do
    it "returns only sessions that match the term" do
      get "/sessions.json?q=term_id=1159"
      sessions = JSON.parse(response.body)

      expect(sessions).not_to be_empty

      sessions.each do |session|
        expect(session["term"]["term_id"]).to eq("1159")
      end
    end

    it "returns only sessions that match either term" do
      get "/sessions.json?q=term_id=1155%7C1159"

      sessions = JSON.parse(response.body)

      expect(sessions).not_to be_empty

      sessions.each do |session|
        expect(session["term"]["term_id"]).to satisfy { |id| %w(1155 1159).include?(id) }
      end
    end
  end

  describe "by academic career" do
    it "returns only sessions that match the academic career" do
      get "/sessions.json?q=academic_career_id=ugrd"

      sessions = JSON.parse(response.body)

      expect(sessions).not_to be_empty

      sessions.each do |session|
        expect(session["academic_career"]["academic_career_id"].downcase).to eq("ugrd")
      end
    end

    it "returns only sessions that match either academic_career" do
      get "/sessions.json?q=academic_career_id=ugrd%7Claw"

      sessions = JSON.parse(response.body)

      expect(sessions).not_to be_empty

      sessions.each do |session|
        expect(session["academic_career"]["academic_career_id"].downcase).to satisfy { |id| %w(ugrd law).include?(id) }
      end
    end
  end

  describe "combining searches" do
    it "returns sessions that match all criteria" do
      get "/sessions.json?q=academic_career_id=ugrd%7Claw,term_id=1159,institution_id=UMNTC"
      sessions = JSON.parse(response.body)

      expect(sessions).not_to be_empty

      session = sessions.sample
      expect(session["academic_career"]["academic_career_id"].downcase).to satisfy { |id| %w(ugrd law).include?(id) }
      expect(session["term"]["term_id"]).to eq("1159")
      expect(session["institution"]["institution_id"]).to eq("UMNTC")
    end
  end
end
