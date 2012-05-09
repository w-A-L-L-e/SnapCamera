class WebcamPicture < ActiveRecord::Base
  attr_accessible :name, :snapshot
  mount_uploader :snapshot, WebcamUploader

end
