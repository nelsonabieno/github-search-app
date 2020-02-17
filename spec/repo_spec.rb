require 'json'
require 'httparty'
require 'pry'

RSpec.describe "GET#Index" do
  before(:all) do
    base_uri= "https://api.github.com/search/repositories?q=tetris+in%3Aname&type=Repositories"
    @response = HTTParty.get(base_uri)
    @parsed_response= JSON.parse(@response.body)
  end

  it "returns a non empty search result" do
    expect(@parsed_response).not_to be_empty
  end

  it "returns search result total count" do
    expect(@parsed_response.keys[0]).to eq("total_count")
  end

  it "returns search result items" do
    expect(@parsed_response.keys[2]).to eq("items")
  end

  it "returns success status code " do
    expect(@response.code).to eq(200)
  end
end
