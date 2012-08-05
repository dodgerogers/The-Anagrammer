class CreateAttachments < ActiveRecord::Migration
  def up
    create_table :attachments do |t|
      t.string :filename
      t.string :content_type
      t.binary :data
    end
  end
  
  def down
    drop_table :attachments
  end
end
