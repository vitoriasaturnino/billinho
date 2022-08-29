class EducationalInstitution < ApplicationRecord
  has_many :Registrations
end

# pode ter varias Registrations 