class TermSource

  include ActiveRecord::Sanitization
  extend ActiveRecord::Querying

  def self.columns_hash
    {}
  end

  def self.connection
    ActiveRecord::Base.connection
  end

  def self.table_name
    "nonsense"
  end

  def self.instantiate(attributes, _)
    Term.new(attributes)
  end

  def self.all
    sql = <<EOS
    WITH eff_session_names AS (
      SELECT fieldname, fieldvalue, XLATLONGNAME, XLATSHORTNAME, max(effdt) as effdt
      FROM asr_warehouse_esup.cs_psxlatitem
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
    from asr_warehouse_esup.cs_ps_session_tbl sessions
    left join asr_warehouse_esup.eff_session_names on
      sessions.session_code = eff_session_names.fieldvalue
    right join asr_warehouse_esup.cs_ps_um_cl_schd_dts schedule_dates on
      sessions.strm = schedule_dates.strm
EOS

    sanitized_sql = sanitize_sql(sql)
    find_by_sql(sanitized_sql).to_set
  end
end