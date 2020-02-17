class RepoController < ApplicationController
  def index
    @total_count = 0
    if params[:repo].present?
      base_uri= "https://api.github.com/search/repositories?q=#{params[:repo]}+in%3Aname&type=Repositories&page=#{params[:page] || 1}"
      @response = HTTParty.get(base_uri)
      @parsed_response= JSON.parse(@response.body)
      @total_count = @parsed_response["total_count"]
      @paginatable_array = Kaminari.paginate_array(@parsed_response["items"], total_count: @parsed_response["total_count"]).page(params[:page]).per(30)
    else
      @message = "Please use the search box to search Github Repository"
    end
  end
end
