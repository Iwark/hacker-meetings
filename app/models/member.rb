# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  meeting_id :integer          not null
#  user_id    :integer          not null
#  joined_at  :datetime         not null
#  status     :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting
end
