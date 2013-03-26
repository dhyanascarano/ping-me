class CreateTemporaryContactDetails < ActiveRecord::Migration
  def change
    create_table :temporary_contact_details do |t|
      t.string :slug
      t.string :email
      t.belongs_to :user
      t.timestamps
    end
  
    add_index :temporary_contact_details, :user_id
    add_index :temporary_contact_details, :slug, :unique => true
    add_index :temporary_contact_details, :email, :unique => true
  end
end
