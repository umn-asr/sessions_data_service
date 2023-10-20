class Term
  attr_accessor :strm

  def initialize(attributes)
    self.strm = attributes["strm"]
  end

  def term_id
    strm
  end

  def type
    "term"
  end

  def hash
    strm.hash
  end

  def ==(other)
    strm == other.strm
  end

  alias_method :eql?, :==

  def self.all
    TermSource.all.sort_by(&:strm)
  end
end
