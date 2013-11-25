class TokenManager
  attr_reader :user_name, :encrypted_password, :token
  
  def initialize(params)
    @user_name = params[:name]
    @encrypted_password = params[:encrypted_password]
  end
  
  def user
    @user ||= User.where({name: user_name, encrypted_password: encrypted_password}).first
  end
  
  def valid_user?
    !user.blank?
  end
  
  def perform
    return 'Invalid User' unless valid_user?
    valid_user_response
  end
  
  def generate_token
    loop do
      random_token = Digest::SHA1.hexdigest([Time.now, rand].join)
      return random_token unless token_invalid?(random_token)
    end
  end
  
  def assign_token
    @token = generate_token
    user.update_attribute(:token, token)
  end
  
  def token_invalid?(token)
    user.class.exists?(token: token)
  end
  
  def valid_user_response
    assign_token
    {token: token}
  end
end