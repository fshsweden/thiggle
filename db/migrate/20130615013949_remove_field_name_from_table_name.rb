class RemoveFieldNameFromTableName < ActiveRecord::Migration
  def up
    remove_column :postings, :post_id
  end

  def down
    add_column :postings, :post_id, :integer
  end
end
