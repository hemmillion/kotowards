class ChangeProverbFromProverb < ActiveRecord::Migration[5.2]
  def change
    change_table :proverbs do |t|
      t.string :score
    end
  end
end