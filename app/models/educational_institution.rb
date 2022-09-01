class EducationalInstitution < ApplicationRecord
  has_many :Registrations

  validates :name, presence: true, uniqueness: true
  validates :cnpj, numericality: { only_integer: true }, length: { is: 11 }, uniqueness: true 
  validates :type, inclusion: { in: %w[Nursery School University] }
end