class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable and  :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  # attr_accessible :title, :body

   def self.authenticate(email,password)
    user= find_by_email(email)
    if user && user.password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
       user
    else
       nil
    end 
           
  end 

  def encrypt_password
   
    if password.present?
       self.password_salt = BCrypt::Engine.generate_salt
       self.password_hash = BCrypt::Engine.hash_secret(password, password_salt) 
    end

  end

end
