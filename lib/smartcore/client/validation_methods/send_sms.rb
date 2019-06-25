module Smartcore
  class Client

    def user_profile_send_sms(phone_number)
      Smartcore::SendSmsRequest.new(api_token: self.token, phone_number: phone_number).execute
    end

  end
end