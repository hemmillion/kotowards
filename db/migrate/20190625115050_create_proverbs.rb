class CreateProverbs < ActiveRecord::Migration[5.2]
  def change
    create_table :proverbs do |t|
      t.text :text
      t.integer :user_id
      t.timestamps null: true
    end
  end
end
