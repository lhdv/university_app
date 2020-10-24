class Course < ApplicationRecord

  validates :short_name, presence: true
  validates :short_name, length: {minimum: 3, maximum: 15}
  
  validates :name, presence: true
  validates :name, length: {minimum: 5, maximum: 30}
  
  validates :description, presence: true
  validates :description, length: {minimum: 10, maximum: 3000}

end