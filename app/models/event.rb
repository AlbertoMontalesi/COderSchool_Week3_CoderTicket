class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}


  

  #to validate that the starting date of the event is not in the past 
  validate :start_at_cannot_be_in_the_past
  def start_at_cannot_be_in_the_past
      unless starts_at.future?
        errors.add(:starts_at, "can't be in the past")
      end
  end



  def self.search(search) 
    where("name ILIKE ?",  "%#{search}%") 
  end


end
