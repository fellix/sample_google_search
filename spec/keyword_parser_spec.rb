#encoding: utf-8
require 'nokogiri'
require './lib/keyword_parser'

describe KeywordParser do
  describe "parsing a valid xml file" do
    let(:filename){ "./keywords.xml" }
    subject{ described_class.new(filename) }
    
    it "should read and parse the file" do
      keywords = subject.keywords
      keywords.size.should == 5
    end
    
    it "return the key word list as string" do
      keywords = subject.keywords
      keywords.should == ["seo software", "ipad", "muffuletta manhattanization", "cheap motels", "שפות תכנות"]
    end
  end
  
  describe "parsing an invalid xml file" do
    let(:filename){ "./spec/invalid.xml" }
    subject{ described_class.new(filename) }
    
    it "returns an empty keyword array" do
      subject.keywords.should be_empty
    end
    
  end
end

