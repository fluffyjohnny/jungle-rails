class User < ActiveRecord::Base

  has_secure_password

  before_validation :downcase_email

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true

  def self.authenticate_with_credentials email, password
    email.strip!
    email.downcase!
    
    user = self.find_by_email email

    if user && user.authenticate(password)
      return user 
    end
    
    nil
  end

  private

  def downcase_email
    if email.present?
      self.email = email.strip.downcase
    end
  end
  
end
