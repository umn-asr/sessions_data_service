object @session
attributes :type, :session_id, :session_code, :session_name, :begin_date, :end_date, :enrollment_open_date

child academic_career: :academic_career do
  attributes :type, :academic_career_id
end

child institution: :institution do
  attributes :type, :institution_id, :abbreviation
end

child term: :term do
  attributes :type, :term_id, :strm
end
