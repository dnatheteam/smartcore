module Smartcore
  class Client

    def user_profile_send_email(email, token, reg_source)
      Smartcore::SendEmailRequest.new(api_token: self.token, email: email, token: token, reg_source: reg_source).execute
    end

  end
end