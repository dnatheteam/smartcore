module Smartcore
  class ConfirmPhoneRequest < TokenRequest
    attribute :phone_number,    String
    attribute :pincode,    String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.confirm_phone_path
    end
  end
end