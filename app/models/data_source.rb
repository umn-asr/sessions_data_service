class DataSource

  include ActiveRecord::Sanitization
  extend ActiveRecord::Querying

  def self.columns_hash
    {}
  end

  def self.connection
    ActiveRecord::Base.connection
  end

  def self.table_name
    "dummy_table_for_active_record"
  end

  def self.all
    sql = <<EOS
    WITH eff_session_names AS (
      SELECT fieldname, fieldvalue, XLATLONGNAME, XLATSHORTNAME, max(effdt) as effdt
      FROM #{Rails.configuration.x.peoplesoft_models_schema}.cs_psxlatitem
      WHERE effdt <= sysdate and
      fieldname = 'SESSION_CODE'
      GROUP BY fieldname, fieldvalue, XLATLONGNAME, XLATSHORTNAME
    )
    select
      sessions.acad_career,
      sessions.institution,
      sessions.strm,
      session_code,
      xlatlongname,
      sess_begin_dt,
      sess_end_dt,
      enroll_open_dt
    from #{Rails.configuration.x.peoplesoft_models_schema}.cs_ps_session_tbl sessions
    left join #{Rails.configuration.x.peoplesoft_models_schema}.eff_session_names on
      sessions.session_code = eff_session_names.fieldvalue
    right join #{Rails.configuration.x.peoplesoft_models_schema}.cs_ps_um_cl_schd_dts schedule_dates on
      sessions.strm = schedule_dates.strm
    order by
      session_code
EOS

    sanitized_sql = sanitize_sql(sql)
    find_by_sql(sanitized_sql).to_set
  end
end