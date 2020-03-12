module Smartcore
  class SendEmailRequest < TokenRequest
    attribute :email,      String
    attribute :token,      String
    attribute :reg_source, String

    def execute
      response = execute_request_with_token
      if response.code == success_status
        Smartcore::SendConfirmationEmailResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.send_confirm_email_path
    end
  end
end
