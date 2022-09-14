class Registration < ApplicationRecord
  require "date"

  belongs_to :educational_institution
  belongs_to :student
  has_many :invoice

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :invoice_quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :expiration_day, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
  validates :course_name, presence: true
end
