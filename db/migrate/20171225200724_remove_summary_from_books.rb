class RemoveSummaryFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :summary, :string
  end
end
