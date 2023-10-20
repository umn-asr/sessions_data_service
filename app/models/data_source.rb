
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
      SELECT
        all_items.fieldvalue,
        all_items.xlatlongname as session_name
      FROM
          #{Rails.configuration.x.peoplesoft_models_schema}.cs_psxlatitem all_items
      INNER JOIN (
          SELECT
              fieldname,
              fieldvalue,
              max(effdt) as effdt
          FROM
              #{Rails.configuration.x.peoplesoft_models_schema}.cs_psxlatitem
          WHERE
              effdt <= sysdate
          GROUP BY
              fieldname, fieldvalue
      ) effective_items ON
        all_items.fieldname = effective_items.fieldname
        AND all_items.fieldvalue = effective_items.fieldvalue
        AND all_items.effdt = effective_items.effdt
      WHERE
          all_items.fieldname = 'SESSION_CODE'
    )
    SELECT
      sessions.acad_career,
      sessions.institution,
      sessions.strm,
      sessions.session_code,
      eff_session_names.session_name,
      sessions.sess_begin_dt,
      sessions.sess_end_dt,
      sessions.enroll_open_dt
    FROM
      #{Rails.configuration.x.peoplesoft_models_schema}.cs_ps_session_tbl sessions
    INNER JOIN
      #{Rails.configuration.x.peoplesoft_models_schema}.eff_session_names ON
      sessions.session_code = eff_session_names.fieldvalue
    INNER JOIN
      -- Restricts the terms returned to just those that can can be scheduled
      #{Rails.configuration.x.peoplesoft_models_schema}.cs_ps_um_cl_schd_dts terms_allowed_to_be_scheduled ON
      sessions.strm = terms_allowed_to_be_scheduled.strm
    ORDER BY
      session_code
EOS

    sanitized_sql = sanitize_sql(sql)
    result_set = connection.select_all(sanitized_sql)
    result_set.map { |record| instantiate(record, []) }.uniq
  end
end
