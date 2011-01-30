class AddDetailsToUserModel < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :name
      t.string :image_url  
    end
    
    add_index :users, :name
  end

  def self.down
    remove_column(:users, :name, :image_url)
  end
end
