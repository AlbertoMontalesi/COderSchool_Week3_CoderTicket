require 'rails_helper'

RSpec.describe Event, :type => :model do

    it 'is not valid without all valid attributes'do
    testevent = Event.new(name:'test event')
    expect(testevent).to_not be_valid
    end

    it 'the date is not valid when it is in the past'do
        testevent = Event.new(starts_at: 1.day.ago)
        expect(testevent.starts_at).to be < Time.now
    end

    it 'the end date is not valid when it is before the start date'do
        testevent = Event.new(starts_at: 2.day.since, ends_at: 1.day.since)
        expect(testevent.ends_at).to be < testevent.starts_at
    end

    describe '.upcoming' do
        it 'returns [] when there is no event' do
        expect(Event.upcoming).to eq []
        end
    end

     describe "#venue_name" do
        it "returns venue name" do
            venue = Venue.new name: "test venue"
            event = Event.new venue: venue
            expect(event.venue.name).to eq "test venue"
    end
  end



end