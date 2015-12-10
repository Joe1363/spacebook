class AddPicturesTable < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id
    end

    add_attachment :pictures, :images
    add_foreign_key :pictures, :users
  end
end
