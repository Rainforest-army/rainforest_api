class Api::V1::CompaniesController < ApplicationController
    def create
      company = Company.create(company_params)
      if company.save
        render json: company        
      else
        render json: {error: "Unable to create company"}
      end    
    end
    
    private

    def company_params
      params.require(:company).permit(:name, :paid_invoice_webhook_url)
    end    
end
