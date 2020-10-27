class Student < ApplicationRecord
  has_secure_password
  
  has_many :student_courses
  has_many :courses, trough: :student_courses
  
  VAL_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_save { self.email = email.downcase }
  
  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 50 }

  validates :email, presence: true
  validates :email, length: { minimum: 6, maximum: 150 }
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: VAL_EMAIL_REGEX }

end