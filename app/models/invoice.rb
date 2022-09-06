class Invoice < ApplicationRecord
  belongs_to :registrations

  validates invoice_amount, presence: true
  validates due_date, presence: true
  validates status, presence: true, if: :valid_status?, default: 'open'
end