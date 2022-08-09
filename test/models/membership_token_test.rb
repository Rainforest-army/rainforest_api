# == Schema Information
#
# Table name: membership_tokens
#
#  id           :bigint           not null, primary key
#  company_id   :bigint           not null
#  address      :string
#  access_level :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class MembershipTokenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
