class AcademicCareerSource < DataSource

  def self.instantiate(attributes, _)
    AcademicCareer.new(attributes)
  end

end