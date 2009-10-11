class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end
  
  def create
    @vote = Vote.new(params[:vote].merge({:ip => request.remote_ip}))
    @vote.save # ignore errors
    
    redirect_to votes_path
  end
  
  def index
    @vote_count = VoteCount.roman_polanski
  end
end
