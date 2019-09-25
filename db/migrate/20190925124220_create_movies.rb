class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :title
      t.text :text
      t.uuid :user_id

      t.timestamps
    end
  end
end
