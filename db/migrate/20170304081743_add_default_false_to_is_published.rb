class AddDefaultFalseToIsPublished < ActiveRecord::Migration[5.0]
  def change
  change_column_default :events, :is_published, from: nil, to: false
  end
end
