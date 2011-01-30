class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :artworks

  # Include devise modules. My modules for production: :database_authenticatable,
  # :recoverable, :trackable, :rememberable
  devise  :registerable, :validatable, :database_authenticatable,
          :recoverable, :trackable, :rememberable


  # Accessible attributes
  attr_accessible :name, :email, :password, :password_confirmation, :image_url, :remember_me, :role_ids

  # Validation
  validates :email, :uniqueness => true
  validates :image_url, :allow_blank => true, :format => {
    :with    => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image or leave blank field.'
  }

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

end
