module Events
  class Serializer
    attr_reader :title, :description, :date
    
    def initialize(event)
      @title = event.title
      @description = event.description
      @date = event.date
    end
    
    def perform
      {
        title: title,
        description: description,
        day: date.day,
        month: date.month,
        year: date.year
      }
    end
  end
end