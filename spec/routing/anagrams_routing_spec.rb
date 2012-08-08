require "spec_helper"

describe AnagramsController do
  describe "routing" do


    it "routes to #new" do
      get("/anagrams/new").should route_to("anagrams#new")
    end

    it "routes to #show" do
      get("/anagrams/1").should route_to("anagrams#show", :id => "1")
    end

    it "routes to #show" do
      post("/anagrams").should route_to("anagrams#create")
    end
  end
end
