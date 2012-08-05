class Anagram < ActiveRecord::Base
   belongs_to :attachment
   attr_accessible :word, :anagram, :attachment_id
   validates_presence_of :word, :attachment_id
   before_save :find_anagrams
   default_scope :order => 'anagrams.created_at DESC'
   
   
   def find_anagrams
    beginning = Time.now
    results = {}
    self.attachment.data.downcase.split(" ").each {|word| results[word.split("").sort] = [[results[word.split("").sort]].join(" ")] << word }
        time = Time.new - beginning
        anagram = ''
        if results[(self.word).downcase.split("").sort!] == nil
          anagram = "nothing found"
        else
          anagram = "#{results[(self.word).downcase.split("").sort!].join(" ")} found in #{time} seconds"
          end
        self.anagram = anagram
   end
end
