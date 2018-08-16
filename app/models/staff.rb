class Staff < ApplicationRecord
  belongs_to :account
  has_many :sheet_author, :class_name => 'PoSheet', :foreign_key => 'author_id'
  has_many :sheet_1stev, :class_name => 'PoSheet', :foreign_key => 'primary_evaluator_id'
  has_many :sheet_2ndev, :class_name => 'PoSheet', :foreign_key => 'secondary_evaluator_id'
end
