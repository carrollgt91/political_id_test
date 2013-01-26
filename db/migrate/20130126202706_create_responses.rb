class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :answer

      t.references :user
      t.references :question

      t.timestamps
    end
  end
end
