class Student < ApplicationRecord
  has_many :registrations

  validates :name, presence: true, uniqueness: true
  validates :cpf, numericality: { only_integer: true }, length: { is: 11 }, uniqueness: true
  validates :cell, numericality: { only_integer: true }
  validates :genre, inclusion: { in: ['F', 'M', 'O'] }
  validates :form_of_payment, inclusion: { in: ['ticket', 'card'] }
end
