class Registration < ApplicationRecord
  belongs_to :EducationalInstitution
  belongs_to :Student

  validates :amount, presence: true, comparison: { greater_than: 0 }
  validates :invoice_quantity, presence: true, comparison: { greater_than_or_equal_to: 1 }
  validates :expiration_day, presence: true, comparison: { greater_than_or_equal_to: 1 && less_than_or_equal_to: 31 }
  validates :course_name, presence: true

  validates :EducationalInstitutional
  validates :Student
end
