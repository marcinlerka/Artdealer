class AddImgTableToArtworks < ActiveRecord::Migration
  def self.up
    change_table :artworks do |t|
      t.string :image_url  
    end
  end

  def self.down
    remove_column(:artworks, :image_url)
  end
end
