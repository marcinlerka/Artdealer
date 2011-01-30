class ChangeArtworksTable < ActiveRecord::Migration
  def self.up
    change_table :artworks do |t|
      t.rename :name, :title  
      t.text :description
    end
  end

  def self.down
    remove_column(:artworks, :title)
    remove_column(:artworks, :description)
  end
end
