class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all

    render
  end
end
