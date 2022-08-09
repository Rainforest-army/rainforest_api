class CreateMembershipTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :membership_tokens do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.string :address
      t.integer :access_level

      t.timestamps
    end
  end
end
