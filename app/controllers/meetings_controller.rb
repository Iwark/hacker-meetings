# Meetingsコントローラ
# Author:: Kohei Iwasaki
# Date:: 2014-05-07
# Meetingを管理するコントローラ
class MeetingsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_meeting, only: [:show, :edit, :update, :destroy, :join, :cancel]
	# Meetings一覧を表示するアクション
	# get /meetings
	def index
		@meetings = Meeting.all
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
			redirect_to meetings_path
		else
			render action: 'new'
		end
	end

	# Meetingの情報を更新するアクション
	# patch /meetings/1
	def edit
	end

	# Meetingを破棄するアクション
	# delete /meetings/1
	def destroy
	end

	# Meetingに参加するアクション
	# post /meetings/join/1
	def join
		@meeting.users << current_user unless @meeting.users.include?(current_user)
		redirect_to :back #前のページへリダイレクト
	end

	# Meetingへの参加をキャンセルするアクション
	# delete /meetings/cancel/1
	def cancel
		@meeting.users.delete(current_user) if @meeting.users.include?(current_user)
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