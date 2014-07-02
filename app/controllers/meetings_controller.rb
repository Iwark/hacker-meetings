# Meetingsコントローラ
# Author:: Kohei Iwasaki
# Date:: 2014-05-07
# Meetingを管理するコントローラ
class MeetingsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_meeting, only: [:show, :edit, :update, :destroy, :join, :cancel]
	# Meetings一覧を表示するアクション
	# get /meetings
	def index
		@meetings = Meeting.all.order("updated_at DESC")
	end

	# 指定したMeetingの情報を取得するアクション
	# get /meetings/1
	def show
	end

	# 新しいMeetingを作成するページへのアクション
	# get /meetings/new
	def new
		@meeting = Meeting.new
	end

	# 新しいMeetingを作成するアクション
	# post /meetings
	def create
		@meeting = Meeting.new(meeting_params)
		@meeting.user = current_user
		if @meeting.save
			member = Member.new
			member.meeting_id = @meeting.id
			member.user_id = current_user.id
			member.joined_at = DateTime.now
			member.status = "join"
			member.save
			redirect_to meetings_path
		else
			render action: 'new'
		end
	end

	# Meetingの情報を更新するページへのアクション
	# patch /meetings/1
	def edit
	end

	# Meetingの情報を更新するアクション
	# patch /meetings/1
	def update
		if @meeting.update(meeting_params)
			redirect_to meeting_path(@meeting)
		else
			render action: 'edit'
		end
	end

	# Meetingを破棄するアクション
	# delete /meetings/1
	def destroy
	end

	# Meetingに参加するアクション
	# post /meetings/join/1
	def join
		if !@meeting.users.include?(current_user)
			member = Member.new
			member.meeting_id = @meeting.id
			member.user_id = current_user.id
			member.joined_at = DateTime.now
			member.status = "join"
			member.save
		elsif @meeting.cancel_members.include?(current_user)
			member = @meeting.members.find_by(user_id:current_user.id)
			if member
				member.status = "join"
				member.joined_at = DateTime.now
				member.save
			end
		end
		redirect_to :back #前のページへリダイレクト
	end

	# Meetingへの参加をキャンセルするアクション
	# delete /meetings/cancel/1
	def cancel
		member = @meeting.members.find_by(user_id:current_user.id)
		if member
			member.status = "cancel"
			member.save
		end
		redirect_to :back #前のページへリダイレクト
	end

	private
	def set_meeting
		@meeting = Meeting.find(params[:id])
	end

	def meeting_params
		params.require(:meeting).permit(:title, :body, :capacity, :image, :start_date, :end_date, :url, :place, :place_info)
	end
end
