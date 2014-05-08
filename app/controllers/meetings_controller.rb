# Meetingsコントローラ
# Author:: Kohei Iwasaki
# Date:: 2014-05-07
# Meetingを管理するコントローラ
class MeetingsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_meeting, only: [:show, :edit, :update, :destroy]
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

	private
	def set_meeting
		@meeting = Meeting.find(params[:id])
	end

	def meeting_params
		params.require(:meeting).permit(:title, :body, :capacity, :image, :start_date, :end_date, :url, :place, :place_info)
	end
end