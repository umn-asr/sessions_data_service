# The data source for academic careers
class AcademicCareerSource < DataSource
  def self.instantiate(attributes, _)
    AcademicCareer.new(attributes)
  end
end
