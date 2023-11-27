require_relative "production"

Rails.application.configure do
  config.x.peoplesoft_models_schema = "asr_warehouse"
end
