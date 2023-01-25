class Invoice < ApplicationRecord
  belongs_to :registrations, class_name: "Registration"

  validates :invoice_amount, presence: true
  validates :due_date, presence: true
  validates :status, presence: true, inclusion: { in: ['open', 'late', 'paid'] }
end
