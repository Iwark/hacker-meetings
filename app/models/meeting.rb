# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :text             not null
#  capacity   :integer
#  user_id    :integer          not null
#  image      :string(255)
#  start_date :datetime         not null
#  end_date   :datetime         not null
#  url        :string(255)
#  place      :string(255)      not null
#  place_info :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Meeting < ActiveRecord::Base
	mount_uploader :image, ImageUploader
  validates_presence_of :title, :body, :user_id, :start_date, :end_date, :place

  belongs_to :user
end
