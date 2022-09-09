class Registration < ApplicationRecord
  require "date"

  belongs_to :educational_institution
  belongs_to :student
  has_many :invoice

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :invoice_quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :expiration_day, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
  validates :course_name, presence: true

  after_create :create_invoices

  def create_invoices
    invoice_amount = amount / invoice_quantity
    date = Time.now.to_date
    current_day = date.day

    if expiration_day >= current_day
      due_date = date.strftime("#{due_date}/%m/%y").to_date
    else
      due_date = date.next_month.strftime("#{due_date}/%m/%y").to_date
    end

    Invoice.create(invoice_amount: invoice_amount, due_date: due_date, status: "open", registration_id: id)

    invoice_index = 1

    while invoice_index < invoice_quantity
      due_date = Date.new(due_date.year, due_date.month, due_date.day).next_month(invoice_index)
      invoice_index += 1
      Invoice.create(invoice_amount: invoice_amount, due_date: due_date, status: "open", registration_id: id)
    end
  end
end

