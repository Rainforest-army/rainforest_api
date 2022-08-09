# == Schema Information
#
# Table name: invoices
#
#  id               :bigint           not null, primary key
#  wallet_id        :bigint           not null
#  payment_hash     :string
#  pamyment_request :string
#  checking_id      :string
#  price_in_usd     :float
#  price_in_sats    :integer
#  paid             :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Invoice < ApplicationRecord
  belongs_to :wallet

  before_create :get_lightning_invoice

  def get_lightning_invoice
    self.price_in_sats = get_price_in_sats(price_in_usd)
    response = get_invoice_from_lnbits
    self.payment_hash = response["payment_hash"]
    self.payment_request = response["payment_request"]
    self.checking_id = response["checking_id"]
  end
  
  private

  def get_price_in_sats(dollar_amount)
    sats_per_usd = Cryptocompare::Price.find('USD', 'SATS')["USD"]["SATS"] # Cryptocompare returns object like {"USD"=>{"SATS"=>xxxx.xx}}
    (sats_per_usd * dollar_amount).round 
  end  

  def get_invoice_from_lnbits
    request = HTTParty.post('https://legend.lnbits.com/api/v1/payments',
      body: {out: false, amount: price_in_sats, memo: "invoice_memo", webhook: "https://rainforest-army-backend.herokuapp.com/order_paid/#{self.id}"}.to_json,
      headers: {'X-Api-Key': self.wallet.lnbits_adminkey, 'Content-Type': "application/json"}
    )
    JSON.parse(request.response.body)
  end  

  def update_as_paid
    self.update(paid: true)
    request = HTTParty.post(self.wallet.company.paid_invoice_webhook_url, 
      body: {'invoice_paid': true}.to_json,
      headers: {'Content-type': 'application/json'}
    )
  end  
end
