class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :first_name, :last_name

  has_one_attached :avatar

  has_many :products
  has_many :reviews

  after_validation :add_name

  def add_name
    self.full_name = [first_name, last_name].join(' ')
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150!').processed
    else
      'avatar/default_avatar.jpg'
    end
  end
end
