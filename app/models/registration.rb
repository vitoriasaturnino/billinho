class Registration < ApplicationRecord
  belongs_to :EducationalInstitution
  belongs_to :Student
  has_many :invoice_quantity

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :invoice_quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :expiration_day, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
  validates :course_name, presence: true
end
