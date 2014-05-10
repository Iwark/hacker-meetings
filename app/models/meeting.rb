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
  has_many :members
  has_many :users, through: :members

  # 参加者の一覧を取得
  def join_members
    users = []
    self.members.where(status:"join").each do |member|
      users << member.user
    end
    users
  end

  # キャンセルした人の一覧を取得
  def cancel_members
    users = []
    self.members.where(status:"cancel").each do |member|
      users << member.user
    end
    users
  end

end
