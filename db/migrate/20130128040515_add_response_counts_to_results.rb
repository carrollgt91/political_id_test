class AddResponseCountsToResults < ActiveRecord::Migration
  def change
    add_column :results, :economic_response_count, :int
    add_column :results, :social_response_count, :int
    add_column :results, :foreign_p_response_count, :int
  end
end
