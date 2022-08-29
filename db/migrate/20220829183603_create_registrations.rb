class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.decimal :amount
      t.integer :invoice_quantity
      t.integer :expiration_day
      t.text :course_name
      t.integer :educational_institution_id
      t.integer :student_id

      t.timestamps
    end
  end
end
