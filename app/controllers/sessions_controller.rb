class SessionsController < ApplicationController
  def index
    @sessions = Session.all

    render
  end
end
