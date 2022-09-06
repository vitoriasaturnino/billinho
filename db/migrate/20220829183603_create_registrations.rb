class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.decimal :amount
      t.integer :invoice_quantity
      t.integer :expiration_day
      t.text :course_name

      t.timestamps
    end
    add_reference :registrations, :educational_institution, null: false, foreign_key: true
    add_reference :registrations, :student, null: false, foreign_key: true
  end
end