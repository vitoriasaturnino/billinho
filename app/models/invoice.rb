class Invoice < ApplicationRecord
  belongs_to :Registrations

  validates invoice_amount, presence: true
  validates due_date, presence: true
  validates status, presence: true, if: :valid_status?, default: 'open'

  validates :Registrations

  def valid_status?
    status in ['open', 'late', 'paid']
  end
end
