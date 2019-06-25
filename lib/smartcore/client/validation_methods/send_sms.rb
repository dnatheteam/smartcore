module Smartcore
  class Client

    def user_profile_send_sms(phone_number)
      Smartcore::SendSmsRequest.new(api_token: self.token, phone_number: phone_numbe).execute
    end

  end
end