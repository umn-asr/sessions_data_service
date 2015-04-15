class AcademicCareersController < ApplicationController
  def index
    @academic_careers = AcademicCareer.all

    render
  end
end
