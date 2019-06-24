module Smartcore
  class Client

    def user_profile_send_email(email, token)
      Smartcore::SendEmailRequest.new(api_token: self.token, email: email, token: token).execute
    end

  end
end