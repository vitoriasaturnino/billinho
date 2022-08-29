class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.decimal :invoice_amount
      t.date :due_date
      t.text :status
      t.integer :registration_id

      t.timestamps
    end
  end
end
