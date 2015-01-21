
class Pbl::SessionsController < CASino::ApplicationController
  include CASino::SessionsHelper

  layout false

  def new
    processor(:LoginCredentialRequestor).process(params, cookies, request.user_agent)
  end
end