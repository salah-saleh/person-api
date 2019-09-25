class CreateCategoriesMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_movies, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.uuid :movie_id
      t.uuid :category_id

      t.timestamps
    end
  end
end
