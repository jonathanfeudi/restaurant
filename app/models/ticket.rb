class Ticket < ActiveRecord::Base
  belongs_to :table
  belongs_to :item

end
