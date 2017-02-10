class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end

    add_index :questions, :title
  end
end
