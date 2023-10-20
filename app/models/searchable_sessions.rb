# Manages searchable sessions
class SearchableSessions
  extend Forwardable
  def_delegators :all_sessions, :each, :select

  attr_reader :all_sessions

  def initialize(all_sessions)
    self.all_sessions = all_sessions.map { |session| SearchableSession.new(session) }
  end

  private

  attr_writer :all_sessions
end

# Manages a searchable session
class SearchableSession < SimpleDelegator
  def institution_id
    @institution ||= session.institution.institution_id
  end

  def term_id
    @term ||= session.term.term_id
  end

  def academic_career_id
    @academic_career ||= session.academic_career.academic_career_id
  end

  def session
    __getobj__
  end
end
