class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :released_year
      t.string :rating
      t.text :reflections

      t.timestamps
      
     
    end
  end
end
