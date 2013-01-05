class RenameQuestionTypeCol < ActiveRecord::Migration
  def up
  	rename_column :questions, :type, :q_type
  end

  def down
  	rename_column :questions, :q_type, :type
  end
end
