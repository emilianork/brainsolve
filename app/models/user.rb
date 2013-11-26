class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Quitamos :recoverable, :trackable, 
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
    
  attr_accessible :telephone, :id, :email, :password, :password_confirmation, :encrypted_password, :nickname, :first_name, :second_name, :third_name, :role

  validates :nickname, format: {with: /(\A((([a-zA-Z]|\d)+)\s*)\z)|\A\z/,message: "Formato inválido"}, presence: true	
  validates :telephone, format: {with: /(\A(((\d{8})|((\d{2}-){3}\d{2})){1}\s*)\z)|(\A\z)/, message: "Formato inválido"}
  validates :first_name, format: {with: /\A[\D]*\z/, message: "Formato inválido"} 
  validates :second_name, format: {with: /\A[\D]*\z/, message: "Formato inválido"}
  validates :third_name, format: {with: /\A[\D]*\z/, message: "Formato inválido"}
  
  has_many :problems, :dependent => :destroy
  has_many :solutions, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
  def role_symbols
      [role.underscore.to_sym]
  end
  
  def self.db_connect?
    begin
      connection = ActiveRecord::Base.connection
      connection.reconnect!
    rescue
      return false
    end
    return true
  end
end
