class CreateUserResults < ActiveRecord::Migration
  def change
    create_table :user_results do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :score

      t.timestamps
    end
  end
end
