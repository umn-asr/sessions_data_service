# The model for institution data
class Institution
  attr_reader :abbreviation

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

  def ==(other)
    abbreviation == other.abbreviation
  end

  alias_method :eql?, :==

  def self.all
    InstitutionSource.all.sort_by(&:abbreviation)
  end

  private

  attr_writer :abbreviation
end
