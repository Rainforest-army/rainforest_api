class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.belongs_to :company, null: false, foreign_key: true
      
      t.string :lnbits_id, unique: true, null: false
      t.string :lnbits_adminkey, unique: true
      t.string :invoice_key, unique: true
      
      t.integer :profit
      t.integer :loss
      t.integer :chain, null: false, default: 0

      t.timestamps
    end
  end
end
