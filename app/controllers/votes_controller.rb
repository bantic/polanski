class VotesController < ApplicationController
  # cache_sweeper :vote_sweeper, :only => [:create]
  # caches_page :index
  
  def new
    @vote = Vote.new
  end
  
  def create
    @vote = Vote.new(params[:vote].merge({:ip => request.remote_ip}))
    @vote.save # ignore errors
    flash[:vote] = @vote.positive? ? "JAIL" : "FREE"
    redirect_to votes_path
  end
  
  def index
    @vote_count = VoteCount.roman_polanski
  end
end
