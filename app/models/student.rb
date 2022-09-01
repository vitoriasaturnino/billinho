class Student < ApplicationRecord
  has_many :Registrations

  validates :name, presence: true, uniqueness: true
  validates :cpf, numericality: { only_integer: true }, length: { is: 11 }, uniqueness: true 
  validates :genre, inclusion: { in: %w[F M O] }
  validates :form_of_payment, inclusion: { in: %w[ticket card] }
end
