# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  name                   :string(255)
#  token                  :string(255)
#  nickname               :string(255)
#  gender                 :string(255)
#  birthday               :string(255)
#  location               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  belonging              :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :my_meetings, foreign_key: :user_id, class_name: "Meeting"
  has_many :members
  has_many :meetings, through: :members

  validates :nickname, length: { minimum: 3, maximum: 8 }, uniqueness: true, on: :update
  validates :email, uniqueness: true, on: :update
  validates :gender, inclusion: { in: ['male', 'female'] }, on: :update

  def self.find_for_facebook_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    unless user
      user = User.create(
        name:     auth.extra.raw_info.name,
        gender:   auth.extra.raw_info.gender,
        location: auth.extra.raw_info.location.name,
        birthday: auth.extra.raw_info.birthday,
        provider: auth.provider,
        uid:      auth.uid,
        email:    auth.info.email,
        token:    auth.credentials.token,
        password: Devise.friendly_token[0,20]
      )
    end

    return user
  end

  def display_name
    if self.nickname
      return self.nickname
    else
      return self.name
    end
  end

end
