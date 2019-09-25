class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.integer :score
      t.uuid :user_id
      t.uuid :movie_id

      t.timestamps
    end
  end
end
