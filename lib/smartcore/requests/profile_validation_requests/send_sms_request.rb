module Smartcore
  class SendSmsRequest < TokenRequest
    attribute :phone_number,    String
    attribute :reg_source, String

    def execute
      response = execute_request_with_token
      if response.code == success_status
        Smartcore::SendConfirmationSmsResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.send_confirm_sms_path
    end
  end
end