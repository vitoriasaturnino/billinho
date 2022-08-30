class Student < ApplicationRecord
  has_many :Registrations

  validates :name, presence: true, uniqueness: true
  validates :cpf, numericality: true, uniqueness: true 
  validates :genre, if: :valid_gender_type?
  validates :form_of_payment, if: :valid_payment_type?

  def valid_gender_type?
    genre in ['F', 'M', 'O']
  end 

  def valid_payment_type?
    form_of_payment in ['ticket', 'card']
  end
end
