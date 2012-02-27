class Applicant < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :addresses, :dependent => :destroy
  has_one :admission_information, :dependent => :destroy
  has_many :secondary_schools, :dependent => :destroy
  has_many :colleges, :dependent => :destroy
  has_many :works, :dependent => :destroy
  has_one :attachment, :dependent => :destroy
  has_many :guardians, :dependent => :destroy
  has_many :healths, :dependent => :destroy
  has_one :uni_related_info, :dependent => :destroy
  
  before_validation :atleast_one
  validates :first_name, :middle_name,:last_name,:date_of_birth, :place_of_birth, :gender,:military_status, :national_id, :national_id_expiry_date, :passport_number, :country_of_issuance, :passport_expiry_date, :transportation,  :presence => true
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type=>['image/jpeg', 'image/png', 'image/gif'], :message => 'Image must be of type jpeg, png or gif'
  validates_date :date_of_birth, :passport_expiry_date, :national_id_expiry_date
  validates_inclusion_of :gender, :in => ["Female", "Male"]
  validates_inclusion_of :military_status, :in => ["completed", "exempted","postponed", "Does not apply"]
  validates_inclusion_of :transportation, :in => ["Private", "Nu buses"]
  
  validates_uniqueness_of :national_id, :case_sensitive => false, :message => "National ID has already taken"
  validates_uniqueness_of :passport_number, :case_sensitive => false, :message => "Passport Number has already taken"
  #CONTINUE VALIDATION  
  
  
  
  attr_writer :current_step
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :admission_information, :colleges, :secondary_schools, :guardians, :attachment, :healths, :works, :uni_related_info 
  attr_accessor :reasons
  attr_accessor :reasons2
  attr_accessor :checkSecondary
  attr_accessor :checkCollege
  attr_accessor :checkWork
  
  #validates_presence_of :addresses, :message => "not exist in the DB"
  validates_associated :addresses, :admission_information,:guardians, :secondary_schools, :colleges, :works, :attachment, :healths, :uni_related_info
  
  
  def to_s
    return "#{first_name} #{last_name}"
  end
  
  def atleast_one
    logger.debug "address sizeeeee s333333333333333333333333333333333333333333333333333"
    logger.debug addresses
  end
    
  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[applicant address admission_information]
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
  end

   
end
