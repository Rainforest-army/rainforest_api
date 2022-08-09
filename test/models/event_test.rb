# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  wallet_id     :bigint           not null
#  is_incoming   :boolean
#  category      :integer
#  amount        :integer
#  event_address :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
