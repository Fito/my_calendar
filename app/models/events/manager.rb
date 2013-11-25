module Events
  class Manager
    attr_reader :token, :user, :events
    
    def initialize(params)
      @token = params[:token]
    end
    
    def user
      @user ||= User.where(token: token).first
    end

    def events
      @events ||= Event.where(user_id: user.id)
    end
    
    def perform
      return 'Invalid Token' unless user
      serialize_events
    end
    
    def serialize_events
      events.map { |event| Serializer.new(event).perform }
    end
  end
end