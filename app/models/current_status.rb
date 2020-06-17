class CurrentStatus < ApplicationRecord
  belongs_to :user
  belongs_to :status
end
