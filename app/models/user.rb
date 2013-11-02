# require 'unix_crypt'

class User < ActiveRecord::Base
  rolify

  # attr_accessible :role_ids, :as => :admin
  # attr_accessible :provider, :uid
  # attr_accessible :first_name
  # attr_accessible :last_name
  # attr_accessible :email
  # attr_accessible :github_username
  # attr_accessible :ssh_username
  # attr_accessible :ssh_public_key
  # attr_accessible :linux_password_hash
  # attr_accessible :enabled, :default_value => true

  # This allows "mass assignment" for linux password since we are not setting
  # it in the DB, we are setting the hash of it
  # attr_protected :id

  validates_presence_of :provider, :uid, :first_name, :last_name, :email, :enabled
  # validates_confirmation_of :linux_password


  # Get the user's full name
  def name
    first_name + ' ' + last_name
  end


  # Read the linux password entered to confirm the password
  def linux_password
    @pw
  end


  # Save the linux password, but really generate the hash and store that
  def linux_password=(value)
    @pw = value
    send('linux_password_hash=', UnixCrypt::SHA512.build(value, generate_salt))
  end


  # Generate a salt suitable for a linux password hash
  def generate_salt
    chars = [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
    len = 16
    (0...len).map{chars[rand(chars.length)] }.join
  end


  # Does this user have the 'admin' role?
  def is_admin?
    has_role? :admin
  end

  # Creates a new User object by using the data provided from omniauth, specifically google_oauth2
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
    end
  end


  # Finds a user by the provider and uid that is supplied by OAuth2
  def self.find_by_provider_and_uid(provider, uid)
    where(:provider => provider, :uid => uid).first
  end

end
