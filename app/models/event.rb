class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types
  accepts_nested_attributes_for :venue, :ticket_types
  #has_many :orders
  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}


  scope :upcoming, -> {where("starts_at > (?) And is_published = (?)", Time.now, true)}
  
  def total_quantity
    ticket_types.sum { |t| t.max_quntity }
  end

  def enough_ticket_types?
    ticket_types.count >= 1
  end

  #to validate that the starting date of the event is not in the past 
  validate :start_at_cannot_be_in_the_past
  def start_at_cannot_be_in_the_past
      unless !starts_at.nil? && starts_at > Time.now
        errors.add(:starts_at, "can't be in the past")
      end
  end

  validate :ends_at_cannot_before_starts_at
  def ends_at_cannot_before_starts_at
    unless !ends_at.nil? && ends_at > starts_at
      errors.add(:ends_at, "can't be before starting date ")
    end
  end



  def self.search(search) 
    where("name ILIKE ?",  "%#{search}%") 
  end


end
