require 'spec_helper'

describe Anagram do
  
  before { @anagram = Anagram.new(word: "estt", anagram: "test", attachment_id: 3) }
  
  subject { @anagram }
  
  it "should respond to word and anagram and attachment_id" do 
    subject.should respond_to(:word)
    subject.should respond_to(:anagram)
    subject.should respond_to(:attachment_id)
  end
  
  describe "with blank content" do
    before { @anagram.word = " " }
      it { should_not be_valid }
    end
    
    describe "can't be created without an attachment id" do 
      before { @anagram.attachment_id = nil }
        it { should_not be_valid }
    end
    
    describe "anagram shouldn't match incorrect words" do 
      before { @anagram.anagram = "mismatch" }
        it { should_not == @anagram.word }
      end
      
      #describe "anagram should contain word letters" do
      #  before { word = @anagram.word.split("").sort }
      #    it { should == @anagram.anagram.split("") }
      #end
end
