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
  validates_numericality_of :capacity, greater_than: 0, less_than: 1000, only_integer: true

  belongs_to :user
  has_many :members
  has_many :users, through: :members

  # 参加者の一覧を取得
  def join_members
    users = []
    self.members.where(status:"join").order("created_at ASC").each do |member|
      users << member.user
    end
    users
  end

  # キャンセルした人の一覧を取得
  def cancel_members
    users = []
    self.members.where(status:"cancel").order("created_at ASC").each do |member|
      users << member.user
    end
    users
  end

  # 開催時刻
  def holds_at
    date = ""
    date += self.start_date.strftime('%Y年%m月%d日 %H:%M')
    date += " - "
    if self.start_date.mday == self.end_date.mday
      date += self.end_date.strftime('%H:%M')
    else
      date += self.end_date.strftime('%d日 %H:%M')
    end
  end

end
