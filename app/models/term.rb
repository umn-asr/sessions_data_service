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

  def self.all
    TermSource.all
  end
end