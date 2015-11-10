class Product < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :product_name, :product_details, :product_no, presence: true
  belongs_to :category
  belongs_to :brand
  validates :product_no, uniqueness: true
end
