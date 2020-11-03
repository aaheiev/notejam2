
Rails.application.config.session_key = ENV['SESSION_KEY'] || 'this1s@secret$e$$i0nKey!'
Rails.application.config.redis_host  = ENV['REDIS_HOST'] || '127.0.0.1'
Rails.application.config.redis_port  = ENV['REDIS_PORT'] || '6379'
Rails.application.config.redis_db    = ENV['REDIS_DB'] || '0'
Rails.application.config.redis_url   = "redis://#{Rails.application.config.redis_host}:#{Rails.application.config.redis_port}/#{Rails.application.config.redis_db}"

Rails.application.config.session_store :redis_session_store, {
    key: Rails.application.config.session_key,
    # key: Rails.application.config.session_key,
    redis: {
        expire_after: 120.minutes,  # cookie expiration
        ttl:          120.minutes,           # Redis expiration, defaults to 'expire_after'
        key_prefix:   "#{Rails.application.class.module_parent_name}:session:",
        url:          Rails.application.config.redis_url,
    }
}
