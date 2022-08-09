class Api::V1::InvoicesController < ApplicationController
    def create
        price = params["price"]
        company = Company.find_by(lnbits_user_id: request.headers['X-api-key'])
        invoice = company.wallets.last.generate_lightning_invoice(params["price"].to_f)
        render json: invoice.to_json(only: [:payment_request, :price_in_usd, :price_in_sats]) 
    end

    def paid
        invoice = Invoice.find(params[:id])
        invoice.update_as_paid
    end    
end
