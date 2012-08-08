require 'spec_helper'

describe Anagram do
  
  before { @anagram = Anagram.new(word: "estt", attachment_id: 3) }
  
  subject { @anagram }
  
  it "should respond to word and anagram and attachment_id methods" do 
    should respond_to(:word)
    should respond_to(:anagram)
    should respond_to(:attachment_id)
  end
  
  it "should respond to the method find anagrams" do
    @anagram.should respond_to(:find_anagrams)
  end
  
  describe "with blank content" do
    before { @anagram.word = " " }
      it { should_not be_valid }
    end
    
    describe "can't be created without an attachment id" do 
      before { @anagram.attachment_id = nil }
        it { should_not be_valid }
    end
    
    describe "should not be valid with incorrect attachment_id" do
      before { @attachment = Attachment.new(filename: "test", content_type: "text/plain", data: "some data", id: 4) }
      before { @anagram.id = 3}
        subject { @anagram.id }
        it { should_not eq(@attachment.id)}
    end
    
    describe "anagram shouldn't match incorrect words" do 
      before { @anagram.anagram = "mismatch" }
        it { should_not == @anagram.word }
      end 
end
