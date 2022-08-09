# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  company_id  :bigint           not null
#  name        :string
#  description :text
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  belongs_to :company
end
