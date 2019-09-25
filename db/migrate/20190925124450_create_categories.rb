class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :name

      t.timestamps
    end
  end
end
