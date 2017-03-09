class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :my_thread, foreign_key: true

      t.timestamps
    end
  end
end
