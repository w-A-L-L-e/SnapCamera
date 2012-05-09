class CreateWebcamPictures < ActiveRecord::Migration
  def change
    create_table :webcam_pictures do |t|
      t.string :name
      t.string :snapshot

      t.timestamps
    end
  end
end
