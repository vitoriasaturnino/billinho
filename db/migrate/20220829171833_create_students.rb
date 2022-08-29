class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.text :name
      t.text :cpf
      t.date :birth_date
      t.integer :cell
      t.text :genre
      t.text :form_of_payment

      t.timestamps
    end
  end
end
