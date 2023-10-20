# Controls requests for terms data
class TermsController < ApplicationController
  def index
    @terms = Term.all

    render
  end
end
