class SessionsController < ApplicationController
  def index
    sessions = Session.all

    searchable_sessions = SearchableSessions.new(sessions)

    query_string_search = params[:q]
    @sessions = QueryStringSearch.new(searchable_sessions, query_string_search).results

    render
  end
end
