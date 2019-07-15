module Smartcore
  class Client

    def user_profile_send_sms(phone_number, reg_source)
      Smartcore::SendSmsRequest.new(api_token: self.token, phone_number: phone_number, reg_source: reg_source).execute
    end

  end
end