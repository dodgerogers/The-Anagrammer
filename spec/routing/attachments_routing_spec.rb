require "spec_helper"

describe AttachmentsController do
  describe "routing" do


    it "routes to #new" do
      get("/attachments/new").should route_to("attachments#new")
    end

    it "routes to #show" do
      get("/attachments/1").should route_to("attachments#show", :id => "1")
    end

    it "routes to #show" do
      post("/attachments").should route_to("attachments#create")
    end
    
    it "routes to #root" do
      get("/").should route_to("attachments#new")
    end
  end
end
