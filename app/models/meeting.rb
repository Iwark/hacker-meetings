class Meeting < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
