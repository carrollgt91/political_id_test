class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :economic_score
      t.integer :social_score
      t.integer :foreign_p_score

      t.timestamps
    end
  end
end
