class CreateYips < ActiveRecord::Migration[5.0]
  def change
    create_table :yips do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
