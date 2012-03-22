class Program < ActiveRecord::Base
  has_many :admission_informations
  has_many :majors, :dependent => :destroy
  
  accepts_nested_attributes_for :majors, :allow_destroy => true
end
