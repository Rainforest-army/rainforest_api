# == Schema Information
#
# Table name: wallets
#
#  id              :bigint           not null, primary key
#  company_id      :bigint           not null
#  lnbits_id       :string           not null
#  lnbits_adminkey :string
#  invoice_key     :string
#  profit          :integer
#  loss            :integer
#  chain           :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Wallet < ApplicationRecord
  belongs_to :company

  has_many :events
  has_many :invoices

  def generate_lightning_invoice(price)
    # self.events.create()
    invoice = self.invoices.create(price_in_usd: price)
  end
end
