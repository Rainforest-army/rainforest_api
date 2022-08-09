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
require "test_helper"

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
