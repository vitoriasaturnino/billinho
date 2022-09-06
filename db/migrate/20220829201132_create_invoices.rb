class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.decimal :invoice_amount
      t.date :due_date
      t.text :status

      t.timestamps
    end
    add_reference :invoices, :registrations, null: false, foreign_key: true
  end
end
