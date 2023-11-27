# Controller for health checks
class HealthController < ActionController::Base
  def show
    if HealthCheck.healthy?
      head :ok
    else
      head :service_unavailable
    end
  end
end
