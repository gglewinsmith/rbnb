class AddPhotoToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :photo, :string
  end
end
