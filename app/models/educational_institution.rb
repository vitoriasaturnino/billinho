class EducationalInstitution < ApplicationRecord
  has_many :Registrations

  validates :name, presence: true, uniqueness: true
  validates :cnpj, numericality: true, uniqueness: true 
  validates :type, if: :university_school_nursery?

  def university_school_nursery?
    type in ['university', 'school', 'nursery']
  end
end