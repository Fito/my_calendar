module Users
  class Factory
    attr_reader :name, :encrypted_password, :params
  
    def initialize(params)
      @params = params
      @name = params[:name]
      @encrypted_password = params[:encrypted_password]
    end
  
    def perform
      return validator.message unless validator.valid?
      create_user
      generate_token
    end
  
    def create_user
      User.create({name: name, encrypted_password: encrypted_password})
    end
  
    def validator
      Users::Validator.new(name, encrypted_password)
    end
  
    def generate_token
      TokenManager.new(params).perform
    end
  end
end