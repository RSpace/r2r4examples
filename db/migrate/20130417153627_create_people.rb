class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.text :bio

      t.timestamps
    end
  end
end