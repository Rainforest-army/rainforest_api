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
require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
