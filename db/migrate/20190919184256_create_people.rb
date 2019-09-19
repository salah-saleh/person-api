class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.date :birthday
      t.string :hobbies

      t.timestamps
    end
  end
end
