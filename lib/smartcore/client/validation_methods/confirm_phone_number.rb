module Smartcore
  class Client

    def user_profile_confirm_phone_number(phone_number, pincode)
      Smartcore::ConfirmPhoneRequest.new(api_token: self.token, phone_number: phone_number, pincode: pincode).execute
    end

  end
end