class AddPublishedToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :is_published, :boolean
  end
end
