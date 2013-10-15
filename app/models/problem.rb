class Problem < ActiveRecord::Base
	attr_accessible :title, :contact, :description, :telephone, :user_id, :areas_of_knowledge

	has_many :solutions, :dependent => :destroy
 	belongs_to :user
  
  	validates :title, presence: true
  	validates :telephone, format: {with: /(\A(((\d{8})|((\d{2}-){3}\d{2})){1}\s*)\z)|/, message: "Formato inválido debe ser un numero telefonico"}
  	validates :contact, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Formato inválido se necesita un correo"},        presence: true
  	validates :description, presence: true
end
