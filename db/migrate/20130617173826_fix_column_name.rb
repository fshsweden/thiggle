class FixColumnName < ActiveRecord::Migration
  def change
      rename_table :postings, :posts
  end

end
