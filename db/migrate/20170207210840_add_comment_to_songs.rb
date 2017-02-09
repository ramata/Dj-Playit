class AddCommentToSongs < ActiveRecord::Migration[5.0]
  def change
    add_reference :songs, :comment, foreign_key: true
  end
end
