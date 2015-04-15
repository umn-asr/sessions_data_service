class Institution
  attr_accessor :abbreviation

  def initialize(attributes)
    self.abbreviation = attributes["institution"]
  end

  def institution_id
    abbreviation
  end

  def type
    "institution"
  end

  def hash
    abbreviation.hash
  end

  def ==(x)
    abbreviation == x.abbreviation
  end

  alias_method :eql?, :==

  def self.all
    InstitutionSource.all
  end

end