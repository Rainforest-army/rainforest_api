class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.belongs_to :wallet, null: false, foreign_key: true

      t.string  :payment_hash
      t.string  :payment_request
      t.string  :checking_id
      
      t.float   :price_in_usd
      t.integer :price_in_sats
      t.boolean :paid, default: false
  
      t.timestamps
    end
  end
end
