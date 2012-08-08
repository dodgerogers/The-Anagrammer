require 'spec_helper'

describe AttachmentsController do
 before { @attachment = fixture_file_upload('/files/words.txt') }
 
 describe "GET new" do
   it "assigns a new attachment as @attachment" do
     get :new
     assigns(:attachment).should be_a_new(Attachment)
   end
 end
 
 describe "POST create" do
   context "with valid params" do
     it "creates a new attachment" do
       expect {
         post :create, attachment: @attachment
       }.to change(Attachment, :count).by(1)
     end
     
      it "assigns a newly created anagram as @anagram" do
         post :create, attachment: @attachment 
         assigns(:attachment).should be_a(Attachment)
         assigns(:attachment).should be_persisted
       end

       it "redirects with the correct code" do
         post :create, attachment: @attachment
         response.code.should eq("302")
       end
       
    context "with invalid attributes" do
        it "does not save the new anagram in the database" 
        it "re-renders the :new template"
        end
     end
   end
end
