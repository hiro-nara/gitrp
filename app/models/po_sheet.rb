class PoSheet < ApplicationRecord
    has_many :objectives
    belongs_to :author, :class_name => 'Staff'
    belongs_to :primary_evaluator, :class_name => 'Staff'
    belongs_to :secondary_evaluator, :class_name => 'Staff'

    accepts_nested_attributes_for :objectives
 

end
