class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :type
      t.boolean :orientation
      t.text :text

      t.timestamps
    end
  end
end
