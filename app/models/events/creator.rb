module Events
  class Creator
    attr_reader :events, :token
    
    def initialize(params)
      @token = params[:token]
      @events = JSON.parse(params[:events])
    end
    
    def perform
      return 'Invalid Token' unless user
      clear_events
      events.each do |event|
        create_event(attributes(event))
      end
    end
    
    def user
      @user ||= Manager.new({token: token}).user
    end
    
    def clear_events
      user.events.delete_all
    end
    
    def create_event(attributes)
      Event.create(attributes)
    end
    
    def attributes(event)
      {
        user_id: user.id,
        title: event['title'],
        description: event['description'],
        date: time_from_date(event)
      }
    end
    
    def time_from_date(event)
      Time.new(event['year'], event['month'], event['day'])
    end
  end
end