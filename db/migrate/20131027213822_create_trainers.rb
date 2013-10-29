class CreateTrainers < ActiveRecord::Migration
  def up
    create_table :trainers do |t|
      t.string  :name
      t.timestamps
    end
  end

  def down
    drop_table :trainers
  end
end