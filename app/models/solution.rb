class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

   attr_accessible :text, :estimate, :currency, :email, :telephone, :company, :company_telephone, :problem_id, 
   :user_id
      
   validates :text, presence: true
   validates :currency, presence: true 
   validates :estimate, presence: true
   validates :telephone, format: {with: /(\A(((\d{8})|((\d{2}-){3}\d{2})){1}\s*)\z)|\A\z/, message: "Formato inválido debe ser un numero telefonico"}
   validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Formato inválido se necesita un correo"},        presence: true*/
   
end
