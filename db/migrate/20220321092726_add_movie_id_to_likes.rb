class AddMovieIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :movie_id, :integer
  end
end
