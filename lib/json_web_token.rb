# require 'jwt'

class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, Figaro.env.jwt_secret, 'HS256')
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Figaro.env.jwt_secret)[0])
  rescue
    nil
  end
end
