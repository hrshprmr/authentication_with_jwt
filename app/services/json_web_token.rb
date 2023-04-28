class JsonWebToken
  SECRET_KEY = "12345"

  def self.encode(user_id, exp = 24.hours.from_now)
    payload = {id: user_id}
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end