FactoryGirl.define do
  factory :anagram do
      word "MyString"
      attachment_id 1
    end
    
    factory :invalid_anagram, class: Anagram do
      word nil
    end
    
    factory :attachment do
      filename "test"
      content_type "text"
      data "some data"
      id 1
    end
    
    factory :invalid_attachment, class: Attachment do
      filename "test"
      content_type "text"
      data
      id 1
    end
  end
    