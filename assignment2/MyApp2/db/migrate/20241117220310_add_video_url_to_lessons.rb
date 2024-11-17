class AddVideoUrlToLessons < ActiveRecord::Migration[7.2]
  def change
    add_column :lessons, :video_url, :string
  end
end
