class AcademicCareer
  attr_accessor :academic_career_id

  def initialize(attributes)
    self.academic_career_id = attributes["acad_career"]
  end

  def type
    "academic_career"
  end

  def hash
    academic_career_id.hash
  end

  def ==(x)
    academic_career_id == x.academic_career_id
  end

  alias_method :eql?, :==

  def self.all
    AcademicCareerSource.all
  end

end