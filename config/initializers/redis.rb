$redis = Rails.env.test? ? MockRedis.new : Redis.new(url: ENV["REDIS_URL"])
