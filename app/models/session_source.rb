class SessionSource < DataSource

  def self.instantiate(attributes, _)
    Session.new(attributes)
  end

end