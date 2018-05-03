class Event < ApplicationRecord

  belongs_to :creator, class_name: 'User'
  has_and_belongs_to_many :attendees, join_table: "events_users", class_name: 'User'

end
