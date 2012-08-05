require 'spec_helper'

describe Attachment do
  
  before { @attachment = Attachment.new(filename: "test.txt", content_type: "text") }
  
  subject { @attachment }
  
  it "should respond to..." do
    subject.should respond_to(:filename)
    subject.should respond_to(:content_type)
    subject.should respond_to(:data)
  end
  
  describe "with blank filename should not be valid" do
    before { @attachment.filename = '' }
    it { should_not be_valid }
  end
  
  describe "blank data should be invalid" do
    before { @attachment.data = ''  }
    it { should_not be_valid }
  end
end
