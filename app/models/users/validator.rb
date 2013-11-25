module Users
  class Validator
    attr_reader :name, :password
  
    def initialize(name, password)
      @name = name
      @password = password
    end
  
    def name_taken?
      @name_taken ||= User.exists?({name: name})
    end

    def valid?
      !name_taken? && !password.blank?
    end
  
    def message
      if name_taken?
        message = "A user with that name already exists"
      elsif password.blank?
        message = "Password can't be blank"
      end
      message
    end
  end
end