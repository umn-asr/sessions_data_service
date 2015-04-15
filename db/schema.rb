# ActiveRecord expects schema.rb to exist.  We don't need a schema.rb file because 
# we are simply reading from the asr_warehouse, so there is no schema to manage.
# Adding this blank file makes rake stop complaining when running our tests.
