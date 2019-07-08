class AddAverageToProverbs < ActiveRecord::Migration[5.2]
  def change
    add_column :proverbs, :average, :integer
  end
end
