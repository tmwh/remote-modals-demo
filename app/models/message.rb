class Message < ActiveRecord::Base
  validates :name, presence: true
end
