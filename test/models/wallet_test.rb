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
require "test_helper"

class WalletTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
