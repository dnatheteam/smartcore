module Smartcore
  class SendSmsRequest < TokenRequest
    attribute :phone_number,    String

    def execute
      response = execute_request_with_token
      if response.status == success_status
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