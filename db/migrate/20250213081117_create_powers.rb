class CreatePowers < ActiveRecord::Migration[7.1]
  def change
    create_table :powers do |t|
      t.string :name

      t.timestamps
    end
  end
end
