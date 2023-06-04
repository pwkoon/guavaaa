class Contact < ApplicationRecord
  validates :name, :email, :phone_number, :question, presence: true
end
