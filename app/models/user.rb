# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :article, dependent: :destroy
  has_many :comment, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true

  devise :database_authenticatable, :registerable,
         :validatable
  include DeviseTokenAuth::Concerns::User

end
