require 'spec_helper'

describe Attachment do
  
  before { @attachment = Attachment.new(id: 3,filename: "test.txt", content_type: "text", data: (File.read('spec/fixtures/files/words.txt'))) }
  
  subject { @attachment }
  
  it "should respond to..." do
    should respond_to(:filename)
    should respond_to(:content_type)
    should respond_to(:data)
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
