class RepoController < ApplicationController
  def index
    if params[:repo].present?
      base_uri= "https://api.github.com/search/repositories?q=#{params[:repo]}+in%3Aname&type=Repositories"
      @res = HTTParty.get(base_uri)
      @response= JSON.parse(@res.body)
    else
      @message = "We couldn't find what you were looking for"
    end
  end
end
