class Product < ApplicationRecord

	validates :price, numericality: true
	validates :name, :price, :description, presence: true

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    has_many :variants, inverse_of: :product, dependent: :destroy

    accepts_nested_attributes_for :variants

end
