# :reek:UtilityFunction

# Model for application health checks
class HealthCheck
  def self.healthy?
    new.healthy?
  end

  def healthy?(sql: "SELECT 'ready' FROM DUAL")
    result = ActiveRecord::Base.connection.select_value(sql)
    result == "ready"
  rescue
    false
  end
end
