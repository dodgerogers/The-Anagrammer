require 'spec_helper'

describe AnagramsController do
  before(:each) do
     @attachment = FactoryGirl.create(:attachment)
     @attrs = FactoryGirl.attributes_for(:anagram, attachment_id: @attachment)
   end

describe "POST create" do
  context "with valid params" do
    it "creates a new anagram" do
      expect {
        post :create, attachment_id: @attachment, anagram: @attrs
      }.to change(Anagram, :count).by(1)
    end

    it "assigns a newly created anagram as @anagram" do
      post :create, attachment_id: @attachment, anagram: @attrs
      assigns(:anagram).should be_a(Anagram)
      assigns(:anagram).should be_persisted
    end

    it "redirects to the created user" do
      post :create, attachment_id: @attachment, anagram: @attrs
      response.should redirect_to(Attachment.last)
    end
    
    context "with invalid attributes" do
      it "does not save the new anagram in the database" do
         expect {
            post :create, attachment_id: @attachment, anagram: FactoryGirl.attributes_for(:invalid_anagram)
          }.to_not change(Anagram, :count)
        end
        
      it "re-renders the :new template" do
        post :create, attachment_id: @attachment, anagram: FactoryGirl.attributes_for(:invalid_anagram)
          response.should redirect_to(Attachment.last)
        end
      end
    end
  end
end
