# The model for session data
class Session
  attr_reader :session_code, :session_name,
    :begin_date, :end_date, :enrollment_open_date, :academic_career,
    :institution, :term

  def initialize(attributes)
    self.academic_career = AcademicCareer.new(attributes)
    self.institution = Institution.new(attributes)
    self.term = Term.new(attributes)
    self.session_code = attributes["session_code"]
    self.session_name = attributes["session_name"]
    self.begin_date = attributes["sess_begin_dt"].strftime("%F")
    self.end_date = attributes["sess_end_dt"].strftime("%F")
    self.enrollment_open_date = attributes["enroll_open_dt"].strftime("%F")
  end

  def type
    "session"
  end

  def session_id
    "#{institution.abbreviation}_#{academic_career.academic_career_id}_#{term.strm}_#{session_code}"
  end

  def hash
    session_id.hash
  end

  def ==(other)
    session_id == other.session_id
  end

  alias_method :eql?, :==

  def self.all
    SessionSource.all.sort_by(&:session_code)
  end

  private

  attr_writer :session_code, :session_name,
    :begin_date, :end_date, :enrollment_open_date, :academic_career,
    :institution, :term
end
