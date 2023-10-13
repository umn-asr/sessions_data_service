# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20230616163331) do

  create_table "ad_hoc_advisors", force: :cascade do |t|
    t.integer   "certification_id",           precision: 38
    t.string    "internet_id"
    t.timestamp "created_at",       limit: 6,                null: false
    t.timestamp "updated_at",       limit: 6,                null: false
  end

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string    "value"
    t.timestamp "created_at", limit: 6, null: false
    t.timestamp "updated_at", limit: 6, null: false
  end

  create_table "audit_requesters", id: false, force: :cascade do |t|
    t.string    "user_id"
    t.integer   "audit_id",             precision: 38
    t.timestamp "created_at", limit: 6,                null: false
    t.timestamp "updated_at", limit: 6,                null: false
  end

  add_index "audit_requesters", ["audit_id"], name: "i_audit_requesters_audit_id", unique: true
  add_index "audit_requesters", ["user_id"], name: "i_audit_requesters_user_id"

  create_table "big_ten24_calculations", force: :cascade do |t|
    t.integer   "rule_report_id",                   precision: 38
    t.boolean   "met",                  limit: nil
    t.boolean   "met_with_in_progress", limit: nil
    t.boolean   "applicable",           limit: nil
    t.timestamp "created_at",           limit: 6,                  null: false
    t.timestamp "updated_at",           limit: 6,                  null: false
  end

  add_index "big_ten24_calculations", ["rule_report_id"], name: "i_bigten24_cal_rul_rep_id"

  create_table "big_ten_gpa_calculations", force: :cascade do |t|
    t.integer   "rule_report_id",                   precision: 38
    t.boolean   "met_with_in_progress", limit: nil
    t.boolean   "applicable",           limit: nil
    t.timestamp "created_at",           limit: 6,                  null: false
    t.timestamp "updated_at",           limit: 6,                  null: false
  end

  add_index "big_ten_gpa_calculations", ["rule_report_id"], name: "i_big_ten_gpa_cal_rul_rep_id"

  create_table "certification_terms", force: :cascade do |t|
    t.boolean   "default_cohort", limit: nil,                default: false, null: false
    t.timestamp "created_at",     limit: 6,                                  null: false
    t.timestamp "updated_at",     limit: 6,                                  null: false
    t.integer   "term_id",                    precision: 38
  end

  create_table "certifications", force: :cascade do |t|
    t.string    "student_athlete_id"
    t.timestamp "created_at",              limit: 6,                                      null: false
    t.timestamp "updated_at",              limit: 6,                                      null: false
    t.integer   "certification_term_id",               precision: 38
    t.string    "dprog"
    t.string    "instcd"
    t.string    "certifying_program_name"
    t.string    "status",                                             default: "Pending"
    t.string    "comp_penalty",                                       default: "Pending"
    t.integer   "certifying_audit_id",                 precision: 38
    t.string    "certified_by"
    t.timestamp "deleted_at",              limit: 6
    t.boolean   "used_for_certification",  limit: nil,                default: false
    t.string    "catlyt"
  end

  create_table "collegiate_review_comments", force: :cascade do |t|
    t.integer   "collegiate_review_id",              precision: 38
    t.string    "text",                 limit: 4000
    t.string    "internet_id"
    t.string    "action"
    t.timestamp "created_at",           limit: 6,                   null: false
    t.timestamp "updated_at",           limit: 6,                   null: false
    t.string    "action_description"
    t.timestamp "deleted_at",           limit: 6
  end

  add_index "collegiate_review_comments", ["deleted_at"], name: "i_col_rev_com_del_at"

  create_table "collegiate_reviews", force: :cascade do |t|
    t.integer   "certification_id",                precision: 38
    t.integer   "audit_id",                        precision: 38
    t.string    "internet_id"
    t.string    "state",                                          default: "unrequested"
    t.string    "updated_dprog"
    t.string    "updated_instcd"
    t.string    "program_status",                                 default: "An adviser has not yet completed step 1: major verification.", null: false
    t.timestamp "requested_at",          limit: 6
    t.timestamp "returned_at",           limit: 6
    t.timestamp "created_at",            limit: 6,                                                                                         null: false
    t.timestamp "updated_at",            limit: 6,                                                                                         null: false
    t.timestamp "apas_last_viewed_date", limit: 6
    t.string    "verify_major"
    t.timestamp "deleted_at",            limit: 6
  end

  add_index "collegiate_reviews", ["deleted_at"], name: "i_col_rev_del_at"
  add_index "collegiate_reviews", ["state"], name: "cr_state"

  create_table "dp_audits", force: :cascade do |t|
    t.integer   "foreign_key_id",                 precision: 38
    t.string    "student_id",                                                    null: false
    t.string    "college_id",                                                    null: false
    t.string    "program_id",                                                    null: false
    t.string    "bulletin_term_year"
    t.boolean   "use_in_progress",    limit: nil,                default: true
    t.string    "dars_job_id"
    t.boolean   "completed",          limit: nil,                default: false
    t.timestamp "created_at",         limit: 6,                                  null: false
    t.timestamp "updated_at",         limit: 6,                                  null: false
  end

  create_table "dp_f_an_abnormal_credit_total", force: :cascade do |t|
    t.integer   "audit_id",              precision: 38
    t.string    "description"
    t.timestamp "created_at",  limit: 6,                null: false
    t.timestamp "updated_at",  limit: 6,                null: false
  end

  add_index "dp_f_an_abnormal_credit_total", ["audit_id"], name: "i_dp_f_an_abn_cre_tot_aud_id"

  create_table "dp_f_an_abnormal_free_elective", force: :cascade do |t|
    t.integer   "audit_id",              precision: 38
    t.string    "description"
    t.timestamp "created_at",  limit: 6,                null: false
    t.timestamp "updated_at",  limit: 6,                null: false
  end

  add_index "dp_f_an_abnormal_free_elective", ["audit_id"], name: "i_dp_f_an_abn_fre_ele_aud_id"

  create_table "dp_f_an_abnormal_req_credits", force: :cascade do |t|
    t.integer   "audit_id",               precision: 38
    t.decimal   "credit_count",           precision: 9,  scale: 3
    t.string    "description"
    t.timestamp "created_at",   limit: 6,                          null: false
    t.timestamp "updated_at",   limit: 6,                          null: false
  end

  add_index "dp_f_an_abnormal_req_credits", ["audit_id"], name: "i_dp_f_an_abn_req_cre_aud_id"

  create_table "dp_f_an_duplicate_ptd", force: :cascade do |t|
    t.integer   "audit_id",               precision: 38
    t.string    "course",      limit: 15
    t.string    "ctitle",      limit: 29
    t.string    "yt",          limit: 6
    t.string    "description"
    t.timestamp "created_at",  limit: 6,                 null: false
    t.timestamp "updated_at",  limit: 6,                 null: false
  end

  add_index "dp_f_an_duplicate_ptd", ["audit_id"], name: "i_dp_f_an_dup_ptd_aud_id"

  create_table "dp_f_an_failed_course_in_ptd", force: :cascade do |t|
    t.integer   "audit_id",              precision: 38
    t.string    "description"
    t.timestamp "created_at",  limit: 6,                null: false
    t.timestamp "updated_at",  limit: 6,                null: false
  end

  create_table "dp_f_an_missing_from_ptd", force: :cascade do |t|
    t.integer   "audit_id",              precision: 38
    t.string    "description"
    t.timestamp "created_at",  limit: 6,                null: false
    t.timestamp "updated_at",  limit: 6,                null: false
  end

  create_table "dp_f_an_run_with_error", force: :cascade do |t|
    t.integer   "audit_id",              precision: 38
    t.string    "description"
    t.timestamp "created_at",  limit: 6,                null: false
    t.timestamp "updated_at",  limit: 6,                null: false
  end

  create_table "dp_f_cr_all", force: :cascade do |t|
    t.integer   "audit_id",                  precision: 38
    t.integer   "jobq_seq_no",               precision: 38
    t.integer   "requirement_id",            precision: 38
    t.string    "rtabx",          limit: 3
    t.string    "stabx",          limit: 3
    t.string    "yt",             limit: 6
    t.string    "course",         limit: 15
    t.string    "xcourse",        limit: 15
    t.decimal   "rcredit",                   precision: 9,  scale: 3
    t.decimal   "credit",                    precision: 9,  scale: 3
    t.decimal   "gpahrs",                    precision: 9,  scale: 3
    t.decimal   "gpapts",                    precision: 9,  scale: 3
    t.decimal   "gpa",                       precision: 9,  scale: 3
    t.string    "grade",          limit: 4
    t.string    "rgrade",         limit: 4
    t.string    "ip",             limit: 1
    t.string    "whatif",         limit: 1
    t.string    "ctitle",         limit: 29
    t.string    "rtitle",         limit: 29
    t.string    "stitle",         limit: 29
    t.string    "cvttitle",       limit: 29
    t.string    "alttitle",       limit: 29
    t.string    "edit_yt",        limit: 4
    t.timestamp "created_at",     limit: 6,                           null: false
    t.timestamp "updated_at",     limit: 6,                           null: false
  end

  add_index "dp_f_cr_all", ["audit_id"], name: "index_dp_f_cr_all_on_audit_id"

  create_table "dp_f_gs_audit_title", force: :cascade do |t|
    t.integer   "audit_id",             precision: 38
    t.string    "title"
    t.timestamp "created_at", limit: 6,                null: false
    t.timestamp "updated_at", limit: 6,                null: false
  end

  add_index "dp_f_gs_audit_title", ["audit_id"], name: "i_dp_f_gs_audit_title_audit_id"

  create_table "dp_f_req_all", force: :cascade do |t|
    t.integer   "audit_id",              precision: 38
    t.integer   "jobq_seq_no",           precision: 38
    t.string    "rname"
    t.string    "rtabx",       limit: 3
    t.string    "stabx",       limit: 3
    t.decimal   "reqhrs",                precision: 9,  scale: 3
    t.string    "sno",         limit: 3
    t.timestamp "created_at",  limit: 6,                          null: false
    t.timestamp "updated_at",  limit: 6,                          null: false
  end

  add_index "dp_f_req_all", ["audit_id"], name: "index_dp_f_req_all_on_audit_id"

  create_table "dp_f_req_ch", force: :cascade do |t|
    t.integer   "audit_id",              precision: 38
    t.integer   "jobq_seq_no",           precision: 38
    t.string    "rname"
    t.string    "rtabx",       limit: 3
    t.string    "stabx",       limit: 3
    t.decimal   "reqhrs",                precision: 9,  scale: 3
    t.string    "sno",         limit: 3
    t.timestamp "created_at",  limit: 6,                          null: false
    t.timestamp "updated_at",  limit: 6,                          null: false
  end

  add_index "dp_f_req_ch", ["audit_id"], name: "index_dp_f_req_ch_on_audit_id"

  create_table "dp_f_req_ptd", force: :cascade do |t|
    t.integer   "audit_id",              precision: 38
    t.integer   "jobq_seq_no",           precision: 38
    t.string    "rname"
    t.string    "rtabx",       limit: 3
    t.string    "stabx",       limit: 3
    t.decimal   "reqhrs",                precision: 9,  scale: 3
    t.string    "sno",         limit: 3
    t.timestamp "created_at",  limit: 6,                          null: false
    t.timestamp "updated_at",  limit: 6,                          null: false
  end

  create_table "dp_job_queue_courses", force: :cascade do |t|
    t.integer "audit_id",               precision: 38
    t.integer "jobq_seq_no",            precision: 38
    t.string  "rtabx",       limit: 3
    t.string  "stabx",       limit: 3
    t.string  "yt",          limit: 6
    t.string  "course",      limit: 15
    t.string  "xcourse",     limit: 15
    t.decimal "rcredit",                precision: 9,  scale: 3
    t.decimal "credit",                 precision: 9,  scale: 3
    t.decimal "gpahrs",                 precision: 9,  scale: 3
    t.decimal "gpapts",                 precision: 9,  scale: 3
    t.decimal "gpa",                    precision: 9,  scale: 3
    t.string  "grade",       limit: 4
    t.string  "rgrade",      limit: 4
    t.string  "ip",          limit: 1
    t.string  "whatif",      limit: 1
    t.string  "ctitle",      limit: 29
    t.string  "rtitle",      limit: 29
    t.string  "stitle",      limit: 29
    t.string  "cvttitle",    limit: 29
    t.string  "alttitle",    limit: 29
    t.string  "edit_yt",     limit: 4
  end

  add_index "dp_job_queue_courses", ["audit_id"], name: "i_dp_job_que_cou_aud_id"

  create_table "dp_job_queue_outs", force: :cascade do |t|
    t.integer "audit_id",                 precision: 38
    t.integer "int_seq_no",               precision: 38
    t.integer "jobq_seq_no",              precision: 38
    t.integer "user_seq_no",              precision: 38
    t.string  "rtabx",       limit: 3
    t.string  "reqstatus",   limit: 1
    t.string  "stabx",       limit: 3
    t.string  "srno",        limit: 2
    t.string  "srstatus",    limit: 1
    t.string  "optline",     limit: 1
    t.string  "lasera",      limit: 1
    t.string  "laserb",      limit: 1
    t.string  "darout",      limit: 2000
  end

  add_index "dp_job_queue_outs", ["audit_id"], name: "i_dp_job_queue_outs_audit_id"

  create_table "dp_job_queue_reqs", force: :cascade do |t|
    t.integer "audit_id",        precision: 38
    t.integer "jobq_seq_no",     precision: 38
    t.string  "rtabx"
    t.string  "rno"
    t.string  "rname"
    t.string  "psname"
    t.string  "category"
    t.string  "summary_grp"
    t.string  "transcript"
    t.string  "total_hour"
    t.string  "hidefromchart"
    t.string  "satisfied"
    t.string  "summary"
    t.string  "sortflg"
    t.string  "orreq"
    t.string  "optreq"
    t.string  "reqsrq"
    t.integer "gotsrq",          precision: 38
    t.integer "needsrq",         precision: 38
    t.integer "reqct",           precision: 38
    t.integer "gotct",           precision: 38
    t.integer "ipct",            precision: 38
    t.integer "whatifct",        precision: 38
    t.integer "needct",          precision: 38
    t.integer "maxhrs",          precision: 38
    t.integer "reqhrs",          precision: 38
    t.integer "est_reqhrs",      precision: 38
    t.integer "gothrs",          precision: 38
    t.integer "iphrs",           precision: 38
    t.integer "whatifhrs",       precision: 38
    t.integer "needhrs",         precision: 38
    t.integer "gotgpahrs",       precision: 38
    t.integer "gotgpapts",       precision: 38
    t.integer "reqgpa",          precision: 38
    t.integer "gotgpa",          precision: 38
    t.integer "needgpa",         precision: 38
    t.string  "total_gpa"
    t.string  "reqgpaf"
    t.string  "gpaname"
    t.string  "gpalowyt"
    t.string  "gpahighyt"
    t.string  "hidden"
    t.string  "hidecategorygpa"
  end

  add_index "dp_job_queue_reqs", ["audit_id"], name: "i_dp_job_queue_reqs_audit_id"

  create_table "dp_job_queue_runs", force: :cascade do |t|
    t.integer  "audit_id",         precision: 38
    t.integer  "int_seq_no",       precision: 38
    t.string   "instidq"
    t.string   "instid"
    t.string   "instcd"
    t.string   "jobid"
    t.string   "userid"
    t.string   "soprid"
    t.string   "stuno"
    t.string   "dprog"
    t.string   "dpmask"
    t.string   "catlyt"
    t.string   "binstid"
    t.string   "binstcd"
    t.string   "jobq_sysout_used"
    t.string   "ncol"
    t.string   "complete"
    t.string   "ip"
    t.string   "dptitle1"
    t.string   "dptitle2"
    t.string   "webtitle"
    t.datetime "rundate"
  end

  add_index "dp_job_queue_runs", ["audit_id"], name: "i_dp_job_queue_runs_audit_id"

  create_table "dp_job_queue_sub_reqs", force: :cascade do |t|
    t.integer "audit_id",                 precision: 38
    t.integer "jobq_seq_no",              precision: 38
    t.string  "rtabx",         limit: 3
    t.string  "stabx",         limit: 3
    t.string  "sno",           limit: 3
    t.string  "satisfied",     limit: 1
    t.string  "sortflg",       limit: 1
    t.string  "orsub",         limit: 1
    t.string  "optsub",        limit: 1
    t.decimal "reqct",                    precision: 9,  scale: 3
    t.decimal "gotct",                    precision: 9,  scale: 3
    t.decimal "needct",                   precision: 9,  scale: 3
    t.decimal "ipct",                     precision: 9,  scale: 3
    t.decimal "whatifct",                 precision: 9,  scale: 3
    t.decimal "maxhrs",                   precision: 9,  scale: 3
    t.decimal "reqhrs",                   precision: 9,  scale: 3
    t.string  "est_reqhrsflg", limit: 1
    t.decimal "est_reqhrs",               precision: 9,  scale: 3
    t.decimal "gothrs",                   precision: 9,  scale: 3
    t.decimal "iphrs",                    precision: 9,  scale: 3
    t.decimal "whatifhrs",                precision: 9,  scale: 3
    t.decimal "needhrs",                  precision: 9,  scale: 3
    t.decimal "reqgpa",                   precision: 9,  scale: 3
    t.decimal "gotgpa",                   precision: 9,  scale: 3
    t.decimal "needgpa",                  precision: 9,  scale: 3
    t.decimal "gotgpahrs",                precision: 9,  scale: 3
    t.decimal "gotgpapts",                precision: 9,  scale: 3
    t.string  "reqgpaf",       limit: 1
    t.string  "gpaname",       limit: 15
    t.string  "gpalowyt",      limit: 6
    t.string  "gpahighyt",     limit: 6
    t.string  "hidden",        limit: 1
    t.integer "subreq_id",                precision: 38
  end

  add_index "dp_job_queue_sub_reqs", ["audit_id"], name: "i_dp_job_que_sub_req_aud_id"

  create_table "event_trackers", force: :cascade do |t|
    t.string    "name"
    t.timestamp "created_at", limit: 6, null: false
    t.timestamp "updated_at", limit: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string    "student_athlete_id"
    t.string    "message"
    t.string    "acknowledged_by"
    t.timestamp "created_at",            limit: 6, null: false
    t.timestamp "updated_at",            limit: 6, null: false
    t.string    "certification_term_id"
    t.string    "person_id"
  end

  create_table "ncaa18_calculations", force: :cascade do |t|
    t.integer   "rule_report_id",                   precision: 38
    t.boolean   "met",                  limit: nil
    t.boolean   "met_with_in_progress", limit: nil
    t.boolean   "applicable",           limit: nil
    t.timestamp "created_at",           limit: 6,                  null: false
    t.timestamp "updated_at",           limit: 6,                  null: false
  end

  add_index "ncaa18_calculations", ["rule_report_id"], name: "i_ncaa18_cal_rul_rep_id"

  create_table "ncaa24_calculations", force: :cascade do |t|
    t.integer   "rule_report_id",                   precision: 38
    t.boolean   "met",                  limit: nil
    t.boolean   "met_with_in_progress", limit: nil
    t.boolean   "applicable",           limit: nil
    t.timestamp "created_at",           limit: 6,                  null: false
    t.timestamp "updated_at",           limit: 6,                  null: false
  end

  add_index "ncaa24_calculations", ["rule_report_id"], name: "i_ncaa24_cal_rul_rep_id"

  create_table "ncaa27_calculations", force: :cascade do |t|
    t.integer   "rule_report_id",                   precision: 38
    t.boolean   "met",                  limit: nil
    t.boolean   "met_with_in_progress", limit: nil
    t.boolean   "applicable",           limit: nil
    t.timestamp "created_at",           limit: 6,                  null: false
    t.timestamp "updated_at",           limit: 6,                  null: false
  end

  add_index "ncaa27_calculations", ["rule_report_id"], name: "i_ncaa27_cal_rul_rep_id"

  create_table "ncaa6_calculations", force: :cascade do |t|
    t.integer   "rule_report_id",                   precision: 38
    t.boolean   "met",                  limit: nil
    t.boolean   "met_with_in_progress", limit: nil
    t.boolean   "applicable",           limit: nil
    t.timestamp "created_at",           limit: 6,                  null: false
    t.timestamp "updated_at",           limit: 6,                  null: false
  end

  add_index "ncaa6_calculations", ["rule_report_id"], name: "i_nca_cal_rul_rep_id"

  create_table "ncaa9_calculations", force: :cascade do |t|
    t.integer   "rule_report_id",                   precision: 38
    t.boolean   "met",                  limit: nil
    t.boolean   "met_with_in_progress", limit: nil
    t.boolean   "applicable",           limit: nil
    t.timestamp "created_at",           limit: 6,                  null: false
    t.timestamp "updated_at",           limit: 6,                  null: false
  end

  add_index "ncaa9_calculations", ["rule_report_id"], name: "i_ncaa9_cal_rul_rep_id"

  create_table "percent_degree_calculations", force: :cascade do |t|
    t.integer   "rule_report_id",                   precision: 38
    t.boolean   "met",                  limit: nil
    t.boolean   "met_with_in_progress", limit: nil
    t.boolean   "applicable",           limit: nil
    t.timestamp "created_at",           limit: 6,                  null: false
    t.timestamp "updated_at",           limit: 6,                  null: false
  end

  add_index "percent_degree_calculations", ["rule_report_id"], name: "i_per_deg_cal_rul_rep_id"

  create_table "rule_reports", force: :cascade do |t|
    t.integer   "certification_id",           precision: 38
    t.integer   "audit_id",                   precision: 38
    t.string    "rules_version"
    t.timestamp "created_at",       limit: 6,                null: false
    t.timestamp "updated_at",       limit: 6,                null: false
  end

  add_index "rule_reports", ["audit_id"], name: "index_rule_reports_on_audit_id"
  add_index "rule_reports", ["certification_id"], name: "i_rul_rep_cer_id"

  create_table "saved_searches", force: :cascade do |t|
    t.text      "criteria"
    t.string    "name"
    t.string    "internet_id"
    t.timestamp "created_at",  limit: 6, null: false
    t.timestamp "updated_at",  limit: 6, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string    "session_id",           null: false
    t.text      "data"
    t.timestamp "created_at", limit: 6, null: false
    t.timestamp "updated_at", limit: 6, null: false
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "student_athletes", force: :cascade do |t|
    t.string    "student_athlete_id"
    t.string    "person_id"
    t.integer   "certification_term_id",           precision: 38
    t.string    "first_term_any",        limit: 4
    t.string    "first_term_umn",        limit: 4
    t.timestamp "created_at",            limit: 6,                null: false
    t.timestamp "updated_at",            limit: 6,                null: false
    t.string    "name"
    t.string    "sortable_name"
    t.string    "name_family_first"
  end

  add_index "student_athletes", ["person_id"], name: "i_student_athletes_person_id"
  add_index "student_athletes", ["student_athlete_id"], name: "i_stu_ath_stu_ath_id"

  create_table "taggings", force: :cascade do |t|
    t.integer   "tag_id",                          precision: 38
    t.string    "student_athlete_id"
    t.string    "user_id"
    t.integer   "certification_term_id",           precision: 38
    t.timestamp "created_at",            limit: 6,                null: false
    t.timestamp "updated_at",            limit: 6,                null: false
  end

  add_index "taggings", ["certification_term_id"], name: "i_tag_cer_ter_id"
  add_index "taggings", ["student_athlete_id"], name: "i_taggings_student_athlete_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["user_id"], name: "index_taggings_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string    "name"
    t.timestamp "created_at", limit: 6,                   null: false
    t.timestamp "updated_at", limit: 6,                   null: false
    t.boolean   "hidden",     limit: nil, default: false, null: false
  end

  create_table "test_advisor_roles", force: :cascade do |t|
    t.string    "emplid"
    t.string    "advisor_role"
    t.timestamp "created_at",   limit: 6, null: false
    t.timestamp "updated_at",   limit: 6, null: false
  end

  create_table "test_advisors", id: false, force: :cascade do |t|
    t.string "advisor_id"
    t.string "student_athlete_id"
    t.string "name"
    t.string "advisor_internet_id"
    t.string "emplid"
  end

  add_index "test_advisors", ["emplid"], name: "index_test_advisors_on_emplid"
  add_index "test_advisors", ["student_athlete_id"], name: "i_tes_adv_stu_ath_id"

  create_table "test_apas_programs", id: false, force: :cascade do |t|
    t.string  "instcd"
    t.string  "dprog"
    t.string  "title"
    t.string  "college_name"
    t.string  "college_abbreviation"
    t.boolean "web_enabled",          limit: nil
  end

  add_index "test_apas_programs", ["dprog"], name: "i_test_apas_programs_dprog"
  add_index "test_apas_programs", ["instcd"], name: "i_test_apas_programs_instcd"

  create_table "test_colleges", force: :cascade do |t|
    t.string    "student_athlete_id"
    t.string    "name"
    t.timestamp "created_at",            limit: 6,                null: false
    t.timestamp "updated_at",            limit: 6,                null: false
    t.integer   "certification_term_id",           precision: 38
  end

  create_table "test_comment_security_snapshot", id: false, force: :cascade do |t|
    t.string "comment_security_id"
    t.string "internet_id"
    t.string "category_id"
    t.string "can_write_comments"
    t.string "can_read_comments"
    t.string "category_name"
  end

  add_index "test_comment_security_snapshot", ["internet_id"], name: "i_tes_com_sec_sna_int_id"

  create_table "test_committees", id: false, force: :cascade do |t|
    t.string "committee_id"
    t.string "student_athlete_id"
    t.string "name"
  end

  add_index "test_committees", ["student_athlete_id"], name: "i_tes_com_stu_ath_id"

  create_table "test_current_apas_programs", force: :cascade do |t|
    t.string "instcd"
    t.string "dprog"
    t.string "emplid"
    t.string "name"
  end

  create_table "test_current_athlete_group", id: false, force: :cascade do |t|
    t.string   "emplid"
    t.datetime "effdt"
    t.string   "institution"
    t.string   "stdnt_group"
    t.string   "eff_status"
  end

  create_table "test_current_athletic_group", id: false, force: :cascade do |t|
    t.string   "emplid"
    t.datetime "effdt"
    t.string   "institution"
    t.string   "stdnt_group"
    t.string   "eff_status"
  end

  create_table "test_current_cohorts_snapshot", id: false, force: :cascade do |t|
    t.string "cohort_member_id"
    t.string "emplid"
    t.string "strm"
    t.string "term_id"
  end

  create_table "test_current_committee_members", id: false, force: :cascade do |t|
    t.string "committee_member_id"
    t.string "emplid"
    t.string "committee_id"
    t.string "name"
  end

  add_index "test_current_committee_members", ["committee_id"], name: "i_tes_cur_com_mem_com_id"

  create_table "test_current_sports_snapshot", id: false, force: :cascade do |t|
    t.string   "emplid"
    t.string   "strm"
    t.string   "abbreviation"
    t.string   "short_name"
    t.string   "long_name"
    t.string   "status"
    t.string   "compete_status"
    t.string   "participation_code"
    t.datetime "effdt"
  end

  create_table "test_current_terms_snapshot", force: :cascade do |t|
    t.string   "strm"
    t.string   "yt"
    t.string   "name"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "first_enroll_date"
    t.string   "aid_year"
  end

  create_table "test_financial_aid_awards", id: false, force: :cascade do |t|
    t.string "emplid",  null: false
    t.string "strm",    null: false
    t.string "has_aid", null: false
  end

  create_table "test_first_term_any_snapshot", force: :cascade do |t|
    t.string    "emplid"
    t.string    "student_athlete_id"
    t.string    "term_id"
    t.string    "strm"
    t.timestamp "created_at",         limit: 6, null: false
    t.timestamp "updated_at",         limit: 6, null: false
  end

  create_table "test_first_term_umn_snapshot", force: :cascade do |t|
    t.string    "emplid"
    t.string    "student_athlete_id"
    t.string    "term_id"
    t.string    "strm"
    t.timestamp "created_at",         limit: 6, null: false
    t.timestamp "updated_at",         limit: 6, null: false
  end

  create_table "test_future_programs", id: false, force: :cascade do |t|
    t.string   "emplid"
    t.string   "acad_career"
    t.integer  "stdnt_car_nbr",           precision: 38
    t.datetime "effdt"
    t.integer  "effseq",                  precision: 38
    t.string   "acad_prog"
    t.datetime "action_dt"
    t.string   "prog_action"
    t.string   "prog_reason"
    t.string   "admit_term"
    t.string   "requirement_term"
    t.string   "exp_grad_term"
    t.string   "prog_status_description"
    t.string   "completion_term"
    t.string   "college_name"
    t.string   "plan_description"
    t.string   "subplan_description"
    t.string   "prog_status"
    t.string   "plan_type"
    t.string   "instcd"
    t.string   "dprog"
    t.string   "plan_code"
    t.string   "college_abbreviation"
  end

  create_table "test_future_pursued_programs", force: :cascade do |t|
    t.string "instcd"
    t.string "dprog"
    t.string "emplid"
    t.string "name"
  end

  create_table "test_gpas_snapshot", id: false, force: :cascade do |t|
    t.string  "student_athlete_id"
    t.string  "term_id"
    t.string  "gpa_type"
    t.decimal "gpa",                precision: 8, scale: 3
    t.string  "acad_career"
  end

  create_table "test_mview_metadata", id: false, force: :cascade do |t|
    t.string   "name"
    t.datetime "last_refresh_date"
    t.string   "unusable",          limit: 1
  end

  create_table "test_ngative_srvc_ind_snapshot", id: false, force: :cascade do |t|
    t.string   "emplid"
    t.string   "institution"
    t.string   "description"
    t.datetime "active_date"
    t.string   "code"
  end

  create_table "test_people", force: :cascade do |t|
    t.string "name"
    t.string "sortable_name"
    t.string "name_family_first"
    t.string "internet_id"
  end

  add_index "test_people", ["internet_id"], name: "test_people_internet_id"

  create_table "test_programs", id: false, force: :cascade do |t|
    t.string   "emplid"
    t.string   "acad_career"
    t.integer  "stdnt_car_nbr",           precision: 38
    t.datetime "effdt"
    t.integer  "effseq",                  precision: 38
    t.string   "acad_prog"
    t.datetime "action_dt"
    t.string   "prog_action"
    t.string   "prog_reason"
    t.string   "admit_term"
    t.string   "requirement_term"
    t.string   "exp_grad_term"
    t.string   "prog_status_description"
    t.string   "completion_term"
    t.string   "college_name"
    t.string   "plan_description"
    t.string   "subplan_description"
    t.string   "prog_status"
    t.string   "plan_type"
    t.string   "instcd"
    t.string   "dprog"
    t.string   "plan_code"
    t.string   "college_abbreviation"
  end

  create_table "test_pseo_course_terms", id: false, force: :cascade do |t|
    t.string "emplid"
    t.string "yt"
  end

  create_table "test_repeated_courses_snapshot", id: false, force: :cascade do |t|
    t.string "student_athlete_id"
    t.string "repeat_name"
    t.string "previous_term_id"
    t.string "repeat_term_id"
    t.string "previous_grade"
    t.string "repeat_grade"
    t.string "previous_name"
  end

  add_index "test_repeated_courses_snapshot", ["student_athlete_id"], name: "i_tes_rep_cou_sna_stu_ath_id"

  create_table "test_special_gpas", id: false, force: :cascade do |t|
    t.string  "emplid",                              null: false
    t.string  "strm",                                null: false
    t.string  "gpa_type",                            null: false
    t.string  "acad_career",                         null: false
    t.decimal "gpa",         precision: 8, scale: 3
  end

  create_table "users", id: false, force: :cascade do |t|
    t.string    "internet_id"
    t.boolean   "administrator",      limit: nil
    t.boolean   "certification_team", limit: nil
    t.timestamp "created_at",         limit: 6,                   null: false
    t.timestamp "updated_at",         limit: 6,                   null: false
    t.timestamp "deleted_at",         limit: 6
    t.string    "deleted_by"
    t.boolean   "athletic_advisor",   limit: nil, default: false
    t.boolean   "miscellaneous",      limit: nil, default: false
  end

  add_index "users", ["internet_id"], name: "index_users_on_internet_id", unique: true

  add_foreign_key "big_ten24_calculations", "rule_reports"
  add_foreign_key "certifications", "certification_terms"
  add_foreign_key "collegiate_review_comments", "collegiate_reviews", on_delete: :cascade
  add_foreign_key "collegiate_reviews", "certifications", on_delete: :cascade
  add_foreign_key "dp_f_an_abnormal_credit_total", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_an_abnormal_free_elective", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_an_abnormal_req_credits", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_an_duplicate_ptd", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_an_failed_course_in_ptd", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_an_missing_from_ptd", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_an_run_with_error", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_cr_all", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_cr_all", "dp_f_req_all", column: "requirement_id", on_delete: :cascade
  add_foreign_key "dp_f_gs_audit_title", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_req_all", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_req_ch", "dp_audits", column: "audit_id"
  add_foreign_key "dp_f_req_ptd", "dp_audits", column: "audit_id"
  add_foreign_key "ncaa18_calculations", "rule_reports"
  add_foreign_key "ncaa24_calculations", "rule_reports"
  add_foreign_key "ncaa27_calculations", "rule_reports"
  add_foreign_key "ncaa9_calculations", "rule_reports"
  add_foreign_key "percent_degree_calculations", "rule_reports"
  add_foreign_key "rule_reports", "certifications"
  add_foreign_key "rule_reports", "dp_audits", column: "audit_id"
  add_foreign_key "student_athletes", "certification_terms"
  add_foreign_key "taggings", "certification_terms"
  add_foreign_key "taggings", "tags"
  add_foreign_key "taggings", "users", primary_key: "internet_id"
end
