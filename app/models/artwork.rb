class Artwork < ActiveRecord::Base
  belongs_to :user

  # Accessible attributes
  attr_accessible :user_id, :title, :price, :image_url, :description

  # Validation
  validates :title, :length => {:minimum => 1, :maximum => 50}
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :image_url, :allow_blank => true, :format => {
    :with    => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image or leave blank field.'
  }

end
