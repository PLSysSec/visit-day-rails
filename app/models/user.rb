class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  include DeviseInvitable::Inviter

  # We always remember users. This function does allow us to overwrite that
  # explicitly, but currently we don't do that
  def remember_me
    (super == nil) ? '1' : super
  end
end
