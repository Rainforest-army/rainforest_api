# == Schema Information
#
# Table name: companies
#
#  id                       :bigint           not null, primary key
#  name                     :string
#  lnbits_user_id           :string
#  auth_token               :string
#  paid_invoice_webhook_url :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class Company < ApplicationRecord
    has_many :wallets
    has_many :membership_tokens
    has_many :products

    after_create :generate_company_assets

    def generate_company_assets
        lightning_init
        generate_wallets
        generate_nfts
    end
    
    private

    def lightning_init
        lnbits_data = create_lnurl_user_for_company
        save_lnbits_wallet_data(lnbits_data)
        add_profit_profit_share_for_wallet(lnbits_data)
    end    

    def create_lnurl_user_for_company
        request = HTTParty.post('https://legend.lnbits.com/usermanager/api/v1/users',
                                body: {
                                    admin_id: "755ca90f679b40cc86b0533a675e2e5e", 
                                    wallet_name: "company_#{self.id}_treasury",
                                    user_name: self.name
                                }.to_json,
                                headers: {'X-Api-Key':  ENV['RAINFOREST_INVOICE_CREATION_WALLET'], 'Content-Type': 'application/json'}
                            )
        response = JSON.parse(request.response.body)
        self.update(lnbits_user_id: response['id'])
        response["wallets"][0]
    end
    
    def save_lnbits_wallet_data(lnbits_data)
        wallet_data = {
            lnbits_id: lnbits_data["id"],
            lnbits_adminkey: lnbits_data["adminkey"],
            invoice_key: lnbits_data["inkey"] 
        }
        
        wallets.create(wallet_data)
    end
    
    def add_profit_profit_share_for_wallet(lnbits_data)
        request = HTTParty.put('https://legend.lnbits.com/splitpayments/api/v1/targets',
                    body: {targets: [
                        {wallet: ENV['RAINFOREST_OPERATIONS_WALLET'], alias: 'Rainforest Comission', percent: '1'}
                    ]}.to_json,
                    headers: {'X-Api-Key': lnbits_data['adminkey'], 'Content-Type': 'application/json'}
                )
    end    

    def generate_wallets()
        # TODO add doge wallet
    end   
    
    def generate_nfts
       #TODO: Use ethereum gem 
    end    
end
