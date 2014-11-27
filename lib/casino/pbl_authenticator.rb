class CASino::PblAuthenticator
  def initialize(options)
    @options = options.deep_symbolize_keys if options
  end

  def validate(id, password)
    Pbl::Services::Users::ValidatePassword.call(id, password)
  end
end