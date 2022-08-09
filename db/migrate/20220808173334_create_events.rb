class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.belongs_to :wallet, null: false, foreign_key: true
      t.boolean :is_incoming
      t.integer :category
      t.integer :amount
      t.string :event_address

      t.timestamps
    end
  end
end
