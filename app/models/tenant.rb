class Tenant < ApplicationRecord
    has_many :apartments, dependent: :destroy
    has_many :tenants, through: :apartments

    validates :name, presence: true
    validates :age, numericality: { greater_than_equal_to: 18 }
end
