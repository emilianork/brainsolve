class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  belongs_to :currency

attr_accessible :text, :estimate, :currency_id, :email, :telephone, :company, :company_telephone, :problem_id, :user_id
  
  validates :text, presence: true
  validates :estimate, format: {with: /(\A(\d+)\z)|(\A\z)/, message: "Debe ser un número"}
  validates :telephone, format: {with: /(\A(((\d{8})|((\d{2}-){3}\d{2})){1}\s*)\z)|\A\z/, message: "Formato inválido debe ser un numero telefonico"}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Formato inválido se necesita un correo"},        presence: true
  validates :currency_id, presence: true
  validates :company_telephone, format: {with: /(\A(((\d{8})|((\d{2}-){3}\d{2})){1}\s*)\z)|\A\z/, message: "Formato inválido debe ser un numero telefonico"}
  
  def owner(user)
  	if user.nil?
  		return false
  	end
  	user_id == user.id
  end
end
