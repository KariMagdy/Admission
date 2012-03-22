class SecondarySchool < ActiveRecord::Base
  belongs_to :applicant
  
  validates :name, :address, :language, :certificate_type, :attended_from , :attended_to, :school_type,:graduation_date, :presence => true
  validates_date :attended_from, :attended_to, :graduation_date
  validates_inclusion_of :school_type, :in => ["Public", "Private"]
  validates_length_of :address, :maximum => 100
  validates_length_of :name, :maximum => 20
  validates_inclusion_of :certificate_type, :in => ["IG", "American Diploma", "GCSE", "Thanaweya Amma"]
  
end