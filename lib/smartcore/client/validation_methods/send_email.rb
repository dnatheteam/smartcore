module Smartcore
  class Client

    def user_profile_send_email(email)
      Smartcore::SendEmailRequest.new(api_token: self.token, email: email).execute
    end

  end
end