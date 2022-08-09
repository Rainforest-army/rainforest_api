class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :lnbits_user_id
      t.string :auth_token
      t.string :paid_invoice_webhook_url

      t.timestamps
    end
  end
end
