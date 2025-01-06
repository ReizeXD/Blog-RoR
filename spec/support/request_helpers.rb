module RequestHelpers
    def log_in_as(user)
      post entrar_path, params: { session: { email: user.email, password: user.password } }
    end
  end
  
  RSpec.configure do |config|
    config.include RequestHelpers, type: :request
  end
  