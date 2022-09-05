class CreateEducationalInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :educational_institutions do |t|
      t.text :name
      t.text :cnpj
      t.text :institution_type

      t.timestamps
    end
  end
end
