class WebcamPicture < ActiveRecord::Base
  attr_accessible :name, :snapshot, :remote_snapshot_url, :snapshot_cache
  mount_uploader :snapshot, WebcamUploader

end
