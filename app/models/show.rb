class Show < ApplicationRecord
  belongs_to :channel
  belongs_to :time_slot
end
