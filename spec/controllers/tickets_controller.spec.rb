require 'rails_helper'


#check that the user must be logged in to access the book ticket view 
    RSpec.describe TicketsController, type: :controller do
        describe 'GET /events/:event_id/tickets/new' do
            it 'redirect user if not logged in' do
            get :new
            expect(response).to redirect_to(new_session_path)

        end
    end

end