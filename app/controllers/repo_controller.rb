class RepoController < ApplicationController
  def index
    if params[:repo].present?
      base_uri= "https://api.github.com/search/repositories?q=#{params[:repo]}+in%3Aname&type=Repositories"
      @response = HTTParty.get(base_uri)
      @parsed_response= JSON.parse(@response.body)
    else
      @message = "We couldn't find what you were looking for"
    end
  end
end
