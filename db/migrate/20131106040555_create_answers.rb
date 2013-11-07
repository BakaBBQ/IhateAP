class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :author
      t.string :title
      t.text :script

      t.timestamps
    end
  end
end
