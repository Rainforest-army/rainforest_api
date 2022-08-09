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
class Event < ApplicationRecord
  belongs_to :wallet

  enum category: {
    invoice_creation: 0,
    invoice_paid: 1,
    invoice_expired: 2,
    nft_generated: 3,
  }
end
