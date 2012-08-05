class CreateAnagrams < ActiveRecord::Migration
  def up
    create_table :anagrams do |t|
      t.string :word
      t.string :anagram
      t.integer :attachment_id
      
      t.timestamps
    end
  end
  
  def down
    drop_table :anagrams
  end
end
