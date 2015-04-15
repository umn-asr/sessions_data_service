class TermSource < DataSource

  def self.instantiate(attributes, _)
    Term.new(attributes)
  end

end