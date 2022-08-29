class Registration < ApplicationRecord
  belongs_to :EducationalInstitution
  belongs_to :Student
end

# pertence a uma apenas uma instituição