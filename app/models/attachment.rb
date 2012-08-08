class Attachment < ActiveRecord::Base
    has_many :anagrams, dependent: :destroy
    attr_accessible :filename, :content_type, :data
    validates_presence_of :filename, :data

    def uploaded_file=(incoming_file)
      self.filename = incoming_file.original_filename
      self.content_type = incoming_file.content_type
      self.data = incoming_file.read
    end

    def filename=(new_filename)
      write_attribute("filename", sanitize_filename(new_filename))
    end

    private

    def sanitize_filename(filename)
      just_filename = File.basename(filename)
      just_filename.gsub(/[^\w\.\-]/, '_')
    end
  end