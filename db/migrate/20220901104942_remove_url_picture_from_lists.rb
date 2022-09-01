class RemoveUrlPictureFromLists < ActiveRecord::Migration[7.0]
  def change
    remove_column :lists, :url_picture, :string
  end
end
