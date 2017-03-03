class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}


  

  #to validate that the starting date of the event is not in the past 
 



  def self.search(search) 
    where("name ILIKE ?",  "%#{search}%") 
  end


end
