class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  # Quitamos :recoverable, :trackable, 
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
    

  validates :nickname, format: {with: /(\A((([a-zA-Z]|\d)+)\s*)\z)|/,message: "Formato inválido"}, presence: true
  validates :telephone, format: {with: /(\A(((\d{8})|((\d{2}-){3}\d{2})){1}\s*)\z)|/, message: "Formato inválido"}
  validates :first_name, format: {with: /\A[\D]*\z/, message: "Formato inválido"}
  validates :second_name, format: {with: /\A[\D]*\z/, message: "Formato inválido"}
  validates :third_name, format: {with: /\A[\D]*\z/, message: "Formato inválido"}

  def role_symbols
      [role.underscore.to_sym]
  end
end
